class Api::V1::ProvincesController < ApplicationController
    protect_from_forgery with: :null_session
    protect_from_forgery with: :null_session
 
    ef index
    provinces = Province.all
    if provinces.present?
      render json: {
        status: 'OK', results: provinces, error: nil
      }, status: :ok
    else
      render json: {
        status: 'FAIL', results: nil, error: 'Data is empty'
      }, status: :unprocessable_entity
    end
    def show
    @prov = Province.find(params[:id])
    
    if @prov.present?
        render json: {
            status: 'OK', results: @prov,
            }, status: :ok
    else
        render json: {
            status: 'FAIL', results: nil, error: 'Data is empty'
            }, status: :unprocessable_entity
    end
end


    
    / def create
        @prov = Province.new(prov_params)
       if @prov.save
            render json: {message: 'success to insert', }, status: :created
        else
            render json: { message: 'failed inserted'}, status: :unprocessable_entity
        end
    end
    #method to destroy
    def destroy
        if @prov
           @prov.destroy!
            render json:{ message: 'success deleted province'}, status: :ok
        else
            render json: { message:'failed deleted province'}, staus: :unprocessable_entity
        end
    end */
    #find the province by id
    def find_prov
        @prov = Province.find_by(id: params[:id])
    end
    def prov_params
        params.permit(:name)
    end
end