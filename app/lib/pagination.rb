class Pagination
  DEFAULT_PAGE_SIZE = 15
  DEFAULT_CURRENT_PAGE = 1

  attr_accessor :page_size, :current_page

  def self.permitted_params
    [:page_size, :current_page]
  end

  def initialize(params)
    @page_size = validate_page_size(params[:page_size])
    @current_page = validate_current_page(params[:current_page])
  end

  def paginate(results)
    total = results.size
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
    raise ApiExceptions::InvalidPageSize if page_size_param <= 0
    page_size_param
  end

  def validate_current_page(param)
    return DEFAULT_CURRENT_PAGE if param.blank?
    current_page_param = param.to_i
    raise ApiExceptions::InvalidCurrentPage if current_page_param <= 0
    current_page_param
  end
end
