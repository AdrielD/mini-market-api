class ProductsQuery < Query
  def paginate
    super(Product)
  end

  def validate_sort_by(param)
    valid_attributes = ['name', 'price', 'created_at', 'updated_at']
    unless valid_attributes.include?(param)
      raise QueryError.invalid_attribute_sorting(param, valid_attributes)
    end
    super(param)
  end
end
