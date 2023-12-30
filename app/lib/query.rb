class Query
  DEFAULT_PAGE_SIZE = 15
  DEFAULT_CURRENT_PAGE = 1
  DEFAULT_SORT_BY = 'id'
  DEFAULT_ORDER = 'ASC'

  attr_accessor :page_size, :current_page, :sort_by, :order

  def self.params
    [:page_size, :current_page, :sort_by, :order]
  end

  def self.entity(entity)
    @@entity = entity
  end

  def self.valid_sortable_attributes(*attributes)
    @@valid_sortable_attributes = attributes.map{ |attr| attr.to_s }
  end

  def initialize(params)
    @page_size = validate_page_size(params[:page_size])
    @current_page = validate_current_page(params[:current_page])
    @sort_by = validate_sort_by(params[:sort_by])
    @order = validate_order(params[:order])
  end

  def execute
    paginate(@@entity.order("#{sort_by} #{order}"))
  end

  def paginate(results)
    total = results.count
    pages = total / page_size + (total % page_size > 0 ? 1 : 0)
    entries = results
                .offset(page_size * (current_page - 1))
                .take(page_size)

    {
      total_pages: pages,
      page_size: page_size,
      current_page: current_page,
      entries: entries
    }
  end

  private

  def validate_page_size(param)
    return DEFAULT_PAGE_SIZE if param.blank?
    page_size_param = param.to_i
    raise ApiError.invalid_page_size if page_size_param <= 0
    page_size_param
  end

  def validate_current_page(param)
    return DEFAULT_CURRENT_PAGE if param.blank?
    current_page_param = param.to_i
    raise ApiError.invalid_current_page if current_page_param <= 0
    current_page_param
  end

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
