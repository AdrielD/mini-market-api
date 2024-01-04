class Api::V1::CategoriesController < Api::ApiController
  def index
    categories = CategoriesQuery.new(permitted_query_params).execute
    paginated_categories = Pagination.new(params).paginate(categories)
    render json: paginated_categories, status: :ok
  end

  def show
    category = Category.find(permitted_category_params[:id])
    render json: category, status: :ok
  end

  def create
    category = Categories::Create.new(permitted_category_params).call
    render json: category, status: :created
  end

  def update
    category = Categories::Update.new(permitted_category_params).call
    render json: category, status: :ok
  end

  def destroy
    result = Categories::Delete.new(permitted_category_params).call
    render json: result, status: :ok
  end

  private

  def permitted_query_params
    merged_params = CategoriesQuery.permitted_params << Pagination.permitted_params
    params.permit(merged_params)
  end

  def permitted_category_params
    params.permit(:id, :name)
  end
end
