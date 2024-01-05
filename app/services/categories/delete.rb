class Categories::Delete < Service
  attr_accessor :id

  def initialize(params)
    @id = params[:id]
  end

  private

  def validate()
    products_in_category = Product.where(category_id: id)
    raise CategoryExceptions::CategoryNotEmpty if products_in_category.present?
  end

  def perform()
    category = Category.find(id)
    category.destroy
    category
  end
end
