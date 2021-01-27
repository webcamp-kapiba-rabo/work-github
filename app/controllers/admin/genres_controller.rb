class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
    flash[:create] = "ジャンルを追加しました"
    redirect_to admin_genres_path
    else
      @genres = Genre.all
      render ("admin/genres/index")
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
    flash[:update] = "ジャンルを修正しました"
    redirect_to admin_genres_path
    else
      @genres = Genre.find(params[:id])
      render ("admin/genres/edit")
    end
  end

  private
  def genre_params
  params.require(:genre).permit(:name)
  end

end
