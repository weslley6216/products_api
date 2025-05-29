class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]

  def index
    @products = Product.ordered_by_name
    render json: @products, status: :ok
  end

  def create
    @product = Product.new(product_params)

    return render json: @product, status: :created if @product.save

    render json: @product.errors, status: :unprocessable_entity
  end

  def show
    render json: @product, status: :ok
  end

  def destroy
    @product.destroy
    head :no_content
  end

  private

  def set_product
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Product not found' }, status: :not_found
  end

  def product_params
    params.require(:product).permit(:name, :price, :sku)
  end
end
