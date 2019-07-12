class Api::V1::UsersController < ApplicationController

  rescue_from User::AlreadyPurchasedError, with: :render_method_not_allowed
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def render_not_found_response(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def render_method_not_allowed(exception)
    render json: { error: exception.message }, status: 405
  end

  # POST /api/v1/users/:id/purchase
  # Params: { "purchase_option_id": 1 }
  def purchase
    # todo: before_action
    purchase_option = PurchaseOption.find(params[:purchase_option_id])
    User.find(params[:id]).purchase(purchase_option)
    render status: 200
  end

  # GET /api/v1/users/:id/purchases
  def purchases
    render json: User.find(params[:id]).library
  end
end
