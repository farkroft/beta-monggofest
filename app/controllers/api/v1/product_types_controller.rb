class Api::V1::ProductTypesController < ApplicationController
    protect_from_forgery with: :null_session
 
    def index
        product_type = ProductType.all
            if product_type.present?
                render json: product_type, status: :ok
            else
                render json: {message_error: 'product_type not found'}, status: :unprocessable_entity
            end
    end

    def show
        product_type = ProductType.find(params[:id])
            render json: {status:'SUCCESS', message: 'Loaded Product Type', data:product_type}, status: :ok
    end

    def create
        product_type = ProductType.new(product_type_params)
        if product_type.save
            render json: {status: 'SUCCESS', message:'Saved product type', data:product_type}, status: :ok
        else
            render json: {status: 'ERROR', message:'product type not saved', data:product_type.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        product_type = ProductType.find(params[:id])
            if product_type.destroy!
                render json: { message: 'success deleted product type' }, status: :destroyed
            else
                render json: { message: 'failed deleted product type' }, status: :unprocessable_entity
            end
    end
    
    def update
        product_type = ProductType.find(params[:id])
            if product_type.update_attributes(product_type_params)
                render json: { message: 'success to updated' }, status: :updated
            else
                render json: { message: 'failed to updated' }, status: :unprocessable_entity
            end
    end
    private
        def product_type_params
            params.require(:product_type).permit(:name)
        end
end
