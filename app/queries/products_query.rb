class ProductsQuery < Query
  entity Product
  valid_sortable_attributes :name, :price, :category_id, :created_at, :updated_at
end
