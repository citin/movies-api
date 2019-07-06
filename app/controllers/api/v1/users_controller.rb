class Api::V1::UsersController < ApplicationController

  # POST /api/v1/users/:id/purchase
  # {
  #   "content_id": 1,
  #   "content_type": "Movie",
  #   "purchase_option": 
  #     {
  #       "price": 2.99,
  #       "video_quality": "HD"
  #     }
  # }
  def purchase
    # build content = params[:content_tipe].classify.find(params[:content_id])
    # check if content is not in user's library
    # build purchase w/options
    # po = PurchaseOption.create(params[:purchase_option])
  end

  # GET /api/v1/users/:id/purchases
  def purchases
    render json: User.find(params[:id]).library.sort_by(&:remaining_time)
  end
end
