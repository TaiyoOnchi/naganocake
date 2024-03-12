class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    if params[:genre_id]
      @items = Item.where(genre_id: params[:genre_id])
    else
      @items = Item.all
    end
    # if params[:search] == "perfect_match"
    #   genre = Genre.where("name LIKE ?", "#{params[:word]}")
    #   @items = Item.where(genre_id: genre.ids)
    # elsif params[:search] == "forward_match"
    #   genre = Genre.where("name LIKE ?", "#{params[:word]}%")
    #   @items = Item.where(genre_id: genre.ids)
    # elsif params[:search] == "backward_match"
    #   genre = Genre.where("name LIKE ?", "%#{params[:word]}")
    #   @items = Item.where(genre_id: genre.ids)
    # elsif params[:search] == "partial_match"
    #   genre = Genre.where("name LIKE ?", "%#{params[:word]}%")
    #   @items = Item.where(genre_id: genre.ids)
    # else
    #   @items = Item.all
    # end
  end

  def show
    @item=Item.find(params[:id])
    @cart_item =CartItem.new
  end
  
end
