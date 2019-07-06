class Api::V1::SeasonsController < ApplicationController

  # GET /api/v1/seasons
  def index
    render json: Season.all.order(:created_at)
  end
end
