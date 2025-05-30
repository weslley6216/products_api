class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :sku, :missing_letter
end
