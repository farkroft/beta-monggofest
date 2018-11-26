class Api::V1::ProvincesController < ApplicationController
    protect_from_forgery with: :null_session   
    def index
        provinces = Province.all
            if provinces.present?
                render json: provinces, status: :ok
            else
                render json: {message_error: 'province not found'}, status: :unprocessable_entity
            end
    end

    def show
        province = Province.find(params[:id])
            render json: {status:'SUCCESS', message: 'Loaded province', data:province}, status: :ok
    end

    def create
        province = Province.new(province_params)
        if province.save
            render json: {status: 200, message:'Saved province', data:province}, status: :ok
        else
            render json: {status: 'ERROR', message:'province not saved', data:province.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        province = Province.find(params[:id])
            if province.destroy!
                render json: { message: 'success deleted province' }, status: :destroyed
            else
                render json: { message: 'failed deleted province' }, status: :unprocessable_entity
            end
    end
    
    def update
        province = Province.find(params[:id])
            if province.update_attributes(province_params)
                render json: { message: 'success to updated' }, status: :updated
            else
                render json: { message: 'failed to updated' }, status: :unprocessable_entity
            end
    end
    private
        def province_params
            params.require(:province).permit(:name)
        end
end
