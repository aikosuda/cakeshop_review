class GenresController < ApplicationController
  def show
  	@genre = Genre.find(params[:id])
  	@products = @genre.products.page(params[:page]).per(8)
  	@genres = Genre.all
  end
end
