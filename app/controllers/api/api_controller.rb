class Api::ApiController < ApplicationController
  rescue_from StandardError, with: :generic_error_handler
  rescue_from QueryError, with: :query_error_handler

  def health_check
    render json: { message: I18n.t('successful_health_check') }, status: :ok
  end

  private

  def generic_error_handler(exception, status = :internal_server_error)
    message = {
      error: exception,
      url: request.url,
      params: params.except(:action, :controller)
    }
    render json: message, status: status
  end

  def query_error_handler(exception)
    generic_error_handler(exception, exception.status)
  end

  def permitted_query_params
    params.permit(Query.params)
  end
end
