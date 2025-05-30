class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]

  def index
    @products = Product.ordered_by_name
    render json: @products, each_serializer: ProductSerializer, status: :ok
  end

  def create
    @product = Product.new(product_params)

    return render json: @product.errors, status: :unprocessable_entity unless @product.save

    render json: @product, serializer: ProductSerializer, status: :created
  end

  def show
    render json: @product, serializer: ProductSerializer, status: :ok
  end

  def update
    return render json: @product.errors, status: :unprocessable_entity unless @product.update(product_params)

    render json: @product, serializer: ProductSerializer
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
