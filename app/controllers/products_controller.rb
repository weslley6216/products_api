class ProductsController < ApplicationController
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
    @product = Product.find(params[:id])
    render json: @product, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Product not found' }, status: :not_found
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    head :no_content

  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Product not found' }, status: :not_found
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :price, :sku)
  end
end