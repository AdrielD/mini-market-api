class Products::Create
  def call(params)
    validate(params)
    perform(params)
  end

  private

  def validate(params)
  end

  def perform(params)
    Product.create(
      name: params[:name],
      description: params[:description],
      category_id: params[:category_id],
      price: params[:price]
    )
  end
end
