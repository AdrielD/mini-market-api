class Categories::Create
  def call(params)
    validate(params)
    perform(params)
  end

  private

  def validate(params)
  end

  def perform(params)
    Category.create(name: params[:name])
  end
end
