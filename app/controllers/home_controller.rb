class HomeController < ApplicationController
  def index
    @product = Product.new
    @user = User.new
  end

  def create
    @user, @product = create_product_and_user(home_params[:email], home_params[:url])
    respond_to do |format|
      if @user.id.present? && @product.save
        format.html { redirect_to root_path, notice: 'Alert was successfully created!' }
      else
        format.html { render :index }
      end
    end
  end

  def success
  end

  private

  def home_params
    params.permit(:url, :email)
  end

  def create_product_and_user(email, product_url)
    ActiveRecord::Base.transaction do
      user = User.find_or_create_by(email: email)
      product = user.products.new(url: product_url)
      [user, product]
    end
  end
end
