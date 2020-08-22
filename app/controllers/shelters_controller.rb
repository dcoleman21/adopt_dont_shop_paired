  class SheltersController < ApplicationController
    def index
      @shelters = Shelter.all
    end

    def show
      @shelter = Shelter.find(params[:id])
    end

    def new 
      @shelter = Shelter.new
    end

    def create
      shelter = Shelter.new({
        name: params[:name],
        address: params[:address],
        city: params[:city],
        state: params[:state],
        zip: params[:zip]
      })

      shelter.save

      redirect_to "/shelters"
    end

    def edit 
      @shelter = Shelter.find(params[:id])
    end

    def update
      shelter = Shelter.find(params[:id])
      
      shelter.update({
        name: params[:name],
        address: params[:address],
        city: params[:city],
        state: params[:state],
        zip: params[:zip]
        })

      shelter.save

      redirect_to "/shelters/#{shelter.id}"
    end

    def destroy
      Shelter.destroy(params[:id])
      
      redirect_to "/shelters"
    end

    private

    def shelters_params
      params.permit(:name, :address, :city, :state, :zip)
    end
  end