class ProductsQuery < Query
  def paginate
    super(Product)
  end

  def validate_sort_by(param)
    valid_attributes = ['name', 'price', 'category_id', 'created_at', 'updated_at']
    super(param, valid_attributes)
  end
end
