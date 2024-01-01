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
    true
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
