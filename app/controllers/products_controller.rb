class ProductsController < ApplicationController
  def create
    @product = Product.new(product_params)

    return render json: @product, status: :created if @product.save

    render json: @product.errors, status: :unprocessable_entity
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :price, :sku)
  end
end