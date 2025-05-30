Product.find_or_create_by!(sku: 'NTB001') do |product|
  product.name = 'Notebook UltraPower X1'
  product.price = 3999.99
end

Product.find_or_create_by!(sku: 'TCLG001') do |product|
  product.name = 'Teclado Gamer RGB Pro'
  product.price = 450.00
end

Product.find_or_create_by!(sku: 'FONEBT01') do |product|
  product.name = 'Fone de Ouvido Soundcode Q45'
  product.price = 299.50
end

puts "Seed data created successfully"
