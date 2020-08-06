class ClientsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :find_client, only: [:show, :edit, :update, :destroy]
    before_action only: [:show, :edit] do 
        not_found(@client)
    end

    def index
        @clients = current_user.clients.search(params[:query])
    end
   
    def new
       @client = current_user.clients.build
    end 

    def create 
        @client = current_user.clients.build(client_params)
        if @client.save
            redirect_to client_path(@client)
        else 
            render :new 
        end
    end

    def show
    end

    def edit
    end

   def update
        if @client.update(client_params)
          redirect_to client_path( @client)
        else 
           render :edit
        end
    end

   def destroy
       @client.destroy
       redirect_to clients_path
   end



    private 
    def client_params
        params.require(:client).permit(:name, :location, :user_id)
    end

    def find_client
        @client = current_user.clients.find_by(id: params[:id])
    end
end
