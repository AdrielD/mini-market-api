class Categories::Create < Service
  attr_accessor :name

  def initialize(params)
    @name = params[:name]
  end

  private

  def validate()
    raise CategoriesError.name_is_empty if name.blank?

    category = Category.find_by(name: name)
    raise CategoriesError.name_already_exists if category.present?
  end

  def perform()
    Category.create(name: name)
  end
end
