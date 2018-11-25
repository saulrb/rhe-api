class CustomersController < ApplicationController
    before_action :authenticate_user
    
    def index
        render json: { status: 200, msg: "Logged-in: #{current_user.username}"}
    end
    
    def find
        firstname = params[:firstname]
        lastname = params[:lastname]
        customer = Customer.find_by_firstname_and_lastname(firstname,lastname)
        if customer.present?
           render json: customer , status: 200, msg: 'success' 
        end
    end
    
    def create
        customer = Customer.new(customer_params) 
        if customer.save
            render json: { status: 200, msg: 'Customer was created' }
        end
    end

    def update
        customer = Customer.find(params[:id])
        if customer.update(customer_params)
            render json: { status: 200, msg: 'Customer details have been updated.'}
        end
    end

    def destroy
        customer = Customer.find(params[:id])
        if customer.destroy
            render json: { status: 200, msg: 'Customer has been deleted.' }
        end    
    end

    def customer_params
        params.require(:customer).permit(:firstname, :lastname, :street, :location, :city, :county, :zip_code, :phone,:mobile, :email)
    end
end
