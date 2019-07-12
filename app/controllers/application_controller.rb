class ApplicationController < ActionController::API
  rescue_from User::AlreadyPurchasedError, with: :render_method_not_allowed
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def render_not_found_response(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def render_method_not_allowed(exception)
    render json: { error: exception.message }, status: 405
  end
end
