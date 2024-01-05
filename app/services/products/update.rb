class Products::Update < Service
  attr_accessor :id, :name, :description, :category_id, :price

  def initialize(params)
    @id = params[:id]
    @name = params[:name]
    @description = params[:description]
    @category_id = params[:category_id]
    @price = params[:price]
  end

  private

  def validate
    raise ProductExceptions::NameIsEmpty if name.blank?

    category = Category.find_by(id: category_id)
    raise ProductExceptions::InexistentCategory if category.blank?

    raise ProductExceptions::InvalidPrice if price.zero?
  end

  def perform
    product = Product.find(id)
    product.update(
      name: name,
      description: description,
      category_id: category_id,
      price: price
    )
    product
  end
end
