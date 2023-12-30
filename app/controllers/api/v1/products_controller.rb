class Api::V1::ProductsController < Api::ApiController
  def index
    products = ProductsQuery.new(permitted_query_params).execute
    render json: products, status: :ok
  end

  private

  def permitted_query_params
    params.permit(ProductsQuery.permitted_params)
  end
end
