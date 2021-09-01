class MoviesController < ApplicationController
  def index
    if params[:query]
      search_result = MovieSearch.new.search(params[:query])
      movie_attributes = {
        title: search_result['l'],
        url: "https://www.imdb.com/title/#{search_result['id']}",
        year: search_result['y'],
        image_url: search_result['i'].first
      }
      #  "i"=>["https://m.media-amazon.com/images/M/MV5BMjM2MDgxMDg0Nl5BMl5BanBnXkFtZTgwNTM2OTM5NDE@._V1_.jpg", 667, 1000]
      @movie = Movie.new(movie_attributes)
    end
  end

  def create
  end

  def destroy
  end
end
