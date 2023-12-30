categories_file = Rails.root.join('db', 'seeds', 'categories.yml')
categories = YAML::load_file(categories_file)
puts categories
categories.each do |c|
  Category.create(name: c['name'])
end

products_file = Rails.root.join('db', 'seeds', 'products.yml')
products = YAML::load_file(products_file)
products.each do |p|
  c = Category.find_by(name: p['category'])
  Product.create(
    name: p['name'],
    description: p['description'],
    category_id: c.id,
    price: p['price']
  )
end
