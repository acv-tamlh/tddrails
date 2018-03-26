class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :getProduct, only: [:show, :edit, :update, :destroy]
  before_action :product_params, only: [:create, :update]
  def index
    @products = Product.all
  end

  def show
    # byebug
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    return redirect_to products_url, notice: 'You have sucessfully created the product' if @product.save
    flash[:alert] = "Error in form 2"
    render :new
  end

  def edit
  end

  def update
    return redirect_to products_url, notice: 'Update sucessfully' if @product.update(product_params)
    flash[:alert] = 'Update fail'
    render :new
  end

  def destroy
    return redirect_to products_url, notice: 'Delete sucessfully' if @product.destroy
      redirect_to products_path, alert: 'Delete failed'
  end

  private
    def getProduct
      @product = Product.find(params[:id])
    end

    def product_params
      product_params = params.require(:product).permit( :title,
                                                  :description,
                                                  :price,
                                                  :published,
                                                  :category_id,
                                                  :country,
                                                  :level)
    end
end
