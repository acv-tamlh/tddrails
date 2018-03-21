class ProductsController < ApplicationController
  before_action :product_params, only:[:create]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    return redirect_to products_path if @product.save
    render :new
  end

  private
    def product_params
      product_params = params.require(:product).permit(:title, :description, :price, :category_id)
    end
end
