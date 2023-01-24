class Public::AddressesController < ApplicationController

  def index
    @customer = current_customer
    @addresses = Address.all
  end
  def create
    @address = Address.new(address_params)
    if @address.save
      flash[:notice] = "配送先の登録が完了しました。"
      redirect_to addresses_path
    else
      render :index
    end
  end
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end
  def edit
   @address = Address.find(params[:id])
  end
  def update
   @address = Address.find(params[:id])
   @address.update(address_params)
   flash[:notice] = "編集が完了しました。"
   redirect_to addresses_path
  end
  
  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
