class CategoriesQuery < Query
  def paginate
    super(Category)
  end

  def validate_sort_by(param)
    valid_attributes = ['name', 'created_at', 'updated_at']
    super(param, valid_attributes)
  end
end
