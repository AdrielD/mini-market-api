class Api::V1::CategoriesController < Api::ApiController
  def index
    categories = CategoriesQuery.new(permitted_query_params).paginate
    render json: categories, status: :ok
  end
end
