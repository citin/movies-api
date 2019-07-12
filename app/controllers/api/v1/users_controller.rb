class Api::V1::UsersController < ApplicationController

  before_action :set_user
  before_action :set_purchase_option, only: [:purchase]

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
    @user.purchase(@purchase_option)
    render json: @user.library
  end

  # GET /api/v1/users/:id/purchases
  def purchases
    render json: @user.library
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_purchase_option
    @purchase_option = PurchaseOption.find(params[:purchase_option_id])    
  end
end
