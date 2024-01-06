class Categories::Update < Service
  attr_accessor :name, :id

  def initialize(params)
    @id = params[:id]
    @name = params[:name]
  end

  private

  def validate()
    raise CategoryExceptions::NameIsEmpty if name.blank?
  end

  def perform()
    category = Category.find(id)
    category.update(name: name)
    category
  end
end
