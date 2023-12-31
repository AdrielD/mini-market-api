class Query
  DEFAULT_SORT_BY = 'id'
  DEFAULT_ORDER = 'ASC'

  attr_accessor :sort_by, :order

  def self.permitted_params
    [:sort_by, :order]
  end

  def self.entity(entity)
    @@entity = entity
  end

  def self.valid_sortable_attributes(*attributes)
    @@valid_sortable_attributes = attributes.map{ |attr| attr.to_s }
  end

  def initialize(params)
    @query = @@entity
    @sort_by = validate_sort_by(params[:sort_by])
    @order = validate_order(params[:order])
  end

  def execute
    self.order_by_attribute
    @query
  end

  protected

  def order_by_attribute
    @query = @query.order("#{sort_by} #{order}")
    self
  end

  private

  def validate_sort_by(param)
    return DEFAULT_SORT_BY if param.blank?
    unless @@valid_sortable_attributes.include?(param)
      raise ApiError.invalid_attribute_sorting(param, @@valid_sortable_attributes)
    end
    param
  end

  def validate_order(param)
    return DEFAULT_ORDER if param.blank?
    raise ApiError.invalid_order unless ['ASC', 'DESC'].include?(param.upcase)
    param.upcase
  end
end
