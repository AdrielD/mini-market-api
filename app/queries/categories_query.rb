class CategoriesQuery < Query
  entity Category
  valid_sortable_attributes :name, :created_at, :updated_at

  attr_accessor :q

  def self.permitted_params
    super << [:q]
  end

  def initialize(params)
    @q = params[:q]
    super(params)
  end

  def execute
    with_name_text_search
    super
  end

  protected

  def with_name_text_search
    @query = @query.search_name(q) unless q.blank?
    self
  end
end
