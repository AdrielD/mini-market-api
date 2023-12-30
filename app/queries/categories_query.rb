class CategoriesQuery < Query
  entity Category
  valid_sortable_attributes :name, :created_at, :updated_at
end
