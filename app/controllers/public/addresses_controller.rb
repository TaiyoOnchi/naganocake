class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end
  
  def create
    @address = current_customer.addresses.new(address_params)
    if @address.save
      redirect_to addresses_path
    else
      @addresses = Address.all
      #@address = Address.new
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    # flash[:success] = "Edit was successfully"
    # redirect_to book_path(book.id)  
    if @address.save
      redirect_to addresses_path
    else
      render :edit
    end
  end
  
  def destroy
    Address.find(params[:id]).destroy
    redirect_to addresses_path
  end
  
  private 
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
  
end
