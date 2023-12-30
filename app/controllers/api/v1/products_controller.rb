class Api::V1::ProductsController < Api::ApiController
  def index
    products = ProductsQuery.new(permitted_query_params).paginate
    render json: products, status: :ok
  end
end
