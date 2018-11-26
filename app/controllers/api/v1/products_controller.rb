class Api::V1::ProductsController < ApplicationController
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token, raise: false
 
    def index
        product = Product.all
            if product.present?
                render json: product, status: :ok
            else
                render json: {message_error: 'product not found'}, status: :unprocessable_entity
            end
    end

    def show
        product = Product.find(params[:id])
            render json: {status:'SUCCESS', message: 'Loaded Product', data:product}, status: :ok
    end

    def create
        product = Product.create(product_params)
        if product.save
            render json: {status: 'SUCCESS', message:'Saved Product', data:product}, status: :ok
        else
            render json: {status: 'ERROR', message:'Product not saved', data:product.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        product = Product.find(params[:id])
            if product.destroy!
                render json: { message: 'success deleted Product' }, status: :destroyed
            else
                render json: { message: 'failed deleted Product' }, status: :unprocessable_entity
            end
    end
    
    def update
        product = Product.find(params[:id])
            if product.update_attributes(product_params)
                render json: { message: 'success to updated' }, status: :updated
            else
                render json: { message: 'failed to updated' }, status: :unprocessable_entity
            end
    end
    private
        def product_params
            params.permit(:name, :image, :province_id, :product_type_id)
        end
end

