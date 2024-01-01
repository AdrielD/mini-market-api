class Products::Create < Service
  attr_accessor :name, :description, :category_id, :price

  def initialize(params)
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
    Product.create(
      name: name,
      description: description,
      category_id: category_id,
      price: price
    )
  end
end
