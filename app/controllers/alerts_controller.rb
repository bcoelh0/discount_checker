class AlertsController < ApplicationController
  before_action :set_user, only: :index

  def index
    if @user.nil?
      redirect_to root_path
      return
    end
    @alerts = @user.alerts
    @email = params[:email]
  end

  def new
    @alert = Alert.new
    @user = User.new
  end

  def create
    @alert = new_alert(alert_params[:name] ,alert_params[:email], alert_params[:url])
    respond_to do |format|
      if @alert.id.present?
        format.html { redirect_to root_path, notice: 'Alert was successfully created!' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @alert = Alert.find(params[:id])
    @alert.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Alert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def alert_params
    params.permit(:name, :url, :email)
  end

  def set_user
    @user = User.find_by(email: params[:email])
  end

  def new_alert(name, email, product_url)
    Alert.transaction do
      @user = User.find_or_create_by(email: email)
      alert = Alert.new(name: name)
      product = Product.new(url: product_url)
      alert.product = Product.create(url: product_url)
      @user.alerts << alert
      alert
    end
  end
end
