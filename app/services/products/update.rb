class Products::Update
  def call(params)
    validate(params)
    perform(params)
  end

  private

  def validate(params)
  end

  def perform(params)
    product = Product.find(params[:id])
    product.update(
      name: params[:name],
      description: params[:description],
      price: params[:price]
    )
    product
  end
end
