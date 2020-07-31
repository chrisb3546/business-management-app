class ClientsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
            @clients = @user.clients
            redirect_if_not_authorized
           else
            redirect_to user_path(current_user)
        end

    end
    
    def new
        if params[:user_id] &&  @user = User.find_by(id: params[:user_id])
        @client = @user.clients.build
        redirect_if_not_authorized
        else 
            redirect_to user_path(current_user)#in case user isnt found to avoid error
        
        end
    end 

    def create 
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
        @client = current_user.clients.build(client_params)
        redirect_if_not_authorized
            if @client.save
           
            redirect_to user_client_path(current_user, @client)
            else 
            render :new 
            end
        end
    end

    def show
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
        @client = Client.find_by(id: params[:id])
        redirect_if_not_authorized
        end
            if @client.user_id != current_user.id
            redirect_to user_path(current_user.id)
            
        end
    end

    def edit
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
        @client = Client.find_by(id: params[:id])
        redirect_if_not_authorized
        end
    end

    def update
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
            @client = Client.find_by(id: params[:id])
            redirect_if_not_authorized
        end
        if @client.update(client_params)
           
                redirect_to user_client_path(current_user, @client)
        else 
                render :edit
        end
        
    end

    def destroy
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
            @client = Client.find_by(id: params[:id]).destroy
            redirect_to user_clients_path(current_user)
            end
    end



    private 
    def client_params
        params.require(:client).permit(:name, :location, :user_id)
        
    end
end
