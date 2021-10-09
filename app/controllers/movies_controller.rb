class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @search_results = []
    if params[:query]
      @search_results = MovieSearch.new.search(params[:query])
      @search_results.map! do |search_result|
        movie_attributes = {
          title: search_result['l'],
          url: "https://www.imdb.com/title/#{search_result['id']}",
          year: search_result['y'],
          image_url: search_result['i'].first
        }
        Rails.logger.info search_result
        Movie.new(movie_attributes)
      end
    end
  end

  def create
    movie = Movie.new(movie_params)
    if movie.save
      redirect_to :movies, params: request.query_parameters
    else
      render :index
    end
  end

  def destroy
  end

  protected

  def movie_params
    params.require('movie').permit(['title','year','url','image_url'])
  end
end
