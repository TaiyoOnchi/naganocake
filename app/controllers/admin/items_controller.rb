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
          redirect_to admin_items_path
        else
            @genre=Genre.all
            render :new
        end
    end

    def edit
      @item=Item.find(params[:id])
      @genre = Genre.all
    end
  
    def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
        flash[:success] = "商品情報が更新されました"
        redirect_to admin_items_path
      else
        flash.now[:error] = "更新に失敗しました"
        @genre= Genre.all
        render :edit
      end
    end

    def item_params
        params.require(:item).permit(:image,:name, :introduction,:price,:is_deleted,:genre_id)
    end
end
