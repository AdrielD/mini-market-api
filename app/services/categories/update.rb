class Categories::Update
  def call(params)
    validate(params)
    perform(params)
  end

  private

  def validate(params)
  end

  def perform(params)
    category = Category.find(params[:id])
    category.update(name: params[:name])
    category
  end
end
