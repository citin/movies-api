class Api::V1::MoviesAndSeasonsController < ApplicationController

  # GET /api/v1/movies_and_season
  def index
    render json: (Movie.all + Season.all).sort_by(&:created_at)
  end
end
