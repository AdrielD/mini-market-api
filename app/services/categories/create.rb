class Categories::Create < Service
  attr_accessor :name

  def initialize(params)
    @name = params[:name]
  end

  private

  def validate()
    raise CategoryExceptions::NameIsEmpty if name.blank?

    category = Category.find_by(name: name)
    raise CategoryExceptions::NameAlreadyExists if category.present?
  end

  def perform()
    Category.create(name: name)
  end
end
