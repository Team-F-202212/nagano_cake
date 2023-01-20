class Admin::CustomersController < ApplicationController
<<<<<<< HEAD
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
        customer = Customer.find(params[:id])
        customer.update(customer_params)
        redirect_to admin_customer_path(customer.id)
    end
    
    private
  
    def customer_params
        params.require(:customer).permit(:first_name, :last_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
    end
=======
>>>>>>> 3110afb3facdb08ccc57f79927b75381b622f80c
    
end
