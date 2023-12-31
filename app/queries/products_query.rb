class ProductsQuery < Query
  entity Product
  valid_sortable_attributes :name, :price, :category_id, :created_at, :updated_at

  attr_accessor :category_id, :q

  def self.permitted_params
    super << [:category_id, :q]
  end

  def initialize(params)
    @category_id = params[:category_id]
    @q = params[:q]
    super(params)
  end

  def execute
    @query = @query
              .joins(:category)
              .select('products.*')
              .select('categories.name as category_name')

    with_name_text_search.by_category
    super
  end

  protected

  def with_name_text_search
    @query = @query.search_name(q) unless q.blank?
    self
  end

  def by_category
    @query = @query.where(category_id: category_id) unless category_id.blank?
    self
  end
end
