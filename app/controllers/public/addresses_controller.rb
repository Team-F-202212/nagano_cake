class Public::AddressesController < ApplicationController
  def create
    @address = Address.new(params[:id])
    @address.save
    redirect_to addresses_path
  end
  
  def index
    @addresses = Address.all
  end
  
  def edit
    @address = Address.find(params[:id])
    redirect_to edit_address_path
  end
  
  def update
    @address = Address.find(params[:id])
    @address.update(params[id])
    redirect_to  address_path
    
  end
  
  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to address_path
  end
end
