class Api::V1::RegionalsController < ApplicationController
    def index
        @region = Regional.all
        if @region.present?
             render json:  @region, status: :ok     
        else
             render json: {message_error: 'province null'}, status: :unprocessable_entity
        end
    end
    def destroy
        if @prov
           @prov.destroy!
            render json:{ message: 'success deleted province'}, status: :ok
        else
            render json: { message:'failed deleted province'}, staus: :unprocessable_entity
        end
    end
end
