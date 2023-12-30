class ProductsQuery < Query
  valid_sortable_attributes :name, :price, :category_id, :created_at, :updated_at

  def paginate
    super(Product.order("#{sort_by} #{order}"))
  end
end
