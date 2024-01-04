class Products::Create < Service
  attr_accessor :name, :description, :category_id, :price

  def initialize(params)
    @name = params[:name]
    @description = params[:description] || ''
    @category_id = params[:category_id]
    @price = params[:price].to_f
  end

  private

  def validate
    raise ProductsError.name_is_empty if name.blank?

    category = Category.find_by(id: category_id)
    raise ProductsError.inexistent_category if category.blank?

    raise ProductsError.invalid_price if price.zero?
  end

  def perform
    Product.create(
      name: name,
      description: description,
      category_id: category_id,
      price: price
    )
  end
end
