class Api::V1::CategoriesController < Api::ApiController
  def index
    categories = CategoriesQuery.new(permitted_query_params).execute
    paginated_categories = Pagination.new(params).paginate(categories)
    render json: paginated_categories, status: :ok
  end

  private

  def permitted_query_params
    merged_params = CategoriesQuery.permitted_params << Pagination.permitted_params
    params.permit(merged_params)
  end
end
