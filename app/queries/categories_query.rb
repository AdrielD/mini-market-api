class CategoriesQuery < Query
  def paginate
    super(Category.all)
  end
end
