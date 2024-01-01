class Api::V1::CategoriesController < Api::ApiController
  def index
    categories = CategoriesQuery.new(permitted_query_params).execute
    paginated_categories = Pagination.new(params).paginate(categories)
    render json: paginated_categories, status: :ok
  end

  def show
    category = Category.find(params[:id])
    render json: category, status: :ok
  end

  def create
    category = Categories::Create.new.call(params)
    render json: category, status: :ok
  end

  def update
    category = Categories::Update.new.call(params)
    render json: category, status: :ok
  end

  private

  def permitted_query_params
    merged_params = CategoriesQuery.permitted_params << Pagination.permitted_params
    params.permit(merged_params)
  end

  def permitted_create_params
    params.permit(:name)
  end
end
