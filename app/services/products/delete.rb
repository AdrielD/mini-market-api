class Products::Delete < Service
  attr_accessor :id

  def initialize(params)
    @id = params[:id]
  end

  private

  def validate()
    # Later, check if there are orders with this product
    # If so, only disable it by active: false
    true
  end

  def perform()
    product = Product.find(id)
    product.destroy
    product
  end
end
