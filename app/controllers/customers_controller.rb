class CustomersController < ApplicationController
    before_action authenticate_user
    
    def index
        render json: { status: 200, msg: 'Logged-in'}
    end
    
    def create
        
    end

    def update
    
    end

    def destroy
    
    end

end
