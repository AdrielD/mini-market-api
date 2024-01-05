class Api::ApiController < ApplicationController
  rescue_from StandardError, with: :generic_error_handler
  rescue_from ApiExceptions::ApiError, with: :query_error_handler
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def health_check
    render json: { message: I18n.t('successful_health_check') }, status: :ok
  end

  private

  def generic_error_handler(exception, status = :internal_server_error)
    message = {
      error: exception.message,
      url: request.url,
      params: params.except(:action, :controller)
    }
    render json: message, status: status
  end

  def query_error_handler(exception)
    generic_error_handler(exception, exception.status)
  end

  def record_not_found(exception)
    generic_error_handler(exception, :not_found)
  end
end
