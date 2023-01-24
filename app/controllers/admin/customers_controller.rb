class Admin::CustomersController < ApplicationController

    def index
        @customers = Customer.page(params[:page]).per(10)
    end
    
    def show
        @customer = Customer.find(params[:id])
    end
    
    def edit
        @customer = Customer.find(params[:id])
    end
    
    def update
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
            redirect_to admin_customer_path(@customer.id), notice: "変更を保存しました"
        else
            render "edit", notice: "変更に失敗しました"
        end
    end
    
    private
  
    def customer_params
        params.require(:customer).permit(:first_name, :last_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
    end

    
end
