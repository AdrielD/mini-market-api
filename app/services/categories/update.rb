class Categories::Update < Service
  attr_accessor :name, :id

  def initialize(params)
    @id = params[:id]
    @name = params[:name]
  end

  private

  def validate()
    raise CategoriesError.name_is_empty if name.blank?

    category = Category.find_by(name: name)
    raise CategoriesError.name_already_exists if category.present?
  end

  def perform()
    category = Category.find(id)
    category.update(name: name)
    category
  end
end
