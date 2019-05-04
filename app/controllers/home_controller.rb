class HomeController < ApplicationController
  def index
  end

  def create
    user = User.find_or_create_by(email: home_params[:email])
    product = user.products.new(url: home_params[:url])
    if product.save
      render plain: "OK"
    else
      render plain: "NOPE"
    end
  end

  private

  def home_params
    params.permit(:url, :email)
  end
end
