class Admin::ItemsController < ApplicationController
    before_action :authenticate_admin!
    def index
        if params[:search] == "perfect_match"
          @items = Item.where("name LIKE ?", "#{params[:word]}")
        elsif params[:search] == "forward_match"
          @items = Item.where("name LIKE ?", "#{params[:word]}%")
        elsif params[:search] == "backward_match"
          @items = Item.where("name LIKE ?", "%#{params[:word]}")
        elsif params[:search] == "partial_match"
          @items = Item.where("name LIKE ?", "%#{params[:word]}%")
          
        else
          @items = Item.all
        end
        
    end

    def new
        @item=Item.new
        @genre=Genre.all
    end

    def create
        @item = Item.new(item_params)
        if @item.save
          flash[:success] = "登録成功"
          redirect_to admin_item_path(@item.id)
        else
            @genre=Genre.all
            render :new
        end
    end

    def edit
    end

    def update
    end

    def item_params
        params.require(:item).permit(:image,:name, :introduction,:price,:is_deleted,:genre_id)
    end
end
