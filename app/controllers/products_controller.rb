class ProductsController < ApplicationController
  before_action :set_user, only: [:index]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = @user.products
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_user
      @user = User.find_by(email: params[:email])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.fetch(:product, {}).permit(:url)
    end
end
