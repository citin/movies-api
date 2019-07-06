class Api::V1::MoviesController < ApplicationController

  # GET /api/v1/movies
  def index
    render json: Movie.all.order(:created_at)
  end
end
