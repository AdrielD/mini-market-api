class ProductsQuery < Query
  entity Product
  valid_sortable_attributes :name, :price, :category_id, :created_at, :updated_at

  attr_accessor :category_id

  def self.permitted_params
    super << [:category_id]
  end

  def initialize(params)
    @category_id = params[:category_id].present? ? params[:category_id].to_i : nil
    super(params)
  end

  def execute
    if category_id.blank?
      super
    else
      query = @@entity
                .joins(:category)
                .select('products.*, categories.name as category_name')
                .where(category_id: category_id)
      query = query.order("#{sort_by} #{order}")
    end
  end
end
