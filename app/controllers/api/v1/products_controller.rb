class Api::V1::ProductsController < Api::ApiController
  def index
    products = ProductsQuery.new(permitted_query_params).execute
    paginated_products = Pagination.new(params).paginate(products)
    render json: paginated_products, status: :ok
  end

  def show
    product = Product.find(permitted_product_params[:id])
    render json: product, status: :ok
  end

  def create
    product = Products::Create.new(permitted_product_params).call
    render json: product, status: :created
  end

  def update
    product = Products::Update.new(permitted_product_params).call
    render json: product, status: :ok
  end

  def destroy
    result = Products::Delete.new(permitted_product_params).call
    render json: result, status: :ok
  end

  private

  def permitted_query_params
    merged_params = ProductsQuery.permitted_params << Pagination.permitted_params
    params.permit(merged_params)
  end

  def permitted_product_params
    params.permit(:id, :name, :description, :category_id, :price)
  end
end
