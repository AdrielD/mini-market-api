class ProductsQuery < Query
  def paginate
    super(Product.all)
  end
end
