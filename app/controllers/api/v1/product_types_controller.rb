class Api::V1::ProductTypesController < ApplicationController
    before_action :find_product, only: [:destroy, :show]
  def index
    product_type = ProductType.all
    if product_type.present?
        render json: product_type, status: :ok
    else
    render json: {message_error: 'product_type not found'}, status: :unprocessable_entity
    end
  end

  def show
    if @product_type.present?
        render json: @product_type, status: :ok
    else
        render json:{message_error: 'product_type not found'}, status: :unprocessable_entity
    end
  end

  def destroy
    if @product_type
      @product_type.destroy!
      render json: { message: 'success deleted product_type' }, status: :ok
    else
      render json: { message: 'failed deleted product_type' }, status: :unprocessable_entity
    end
  end

  def create
    product_type = ProductType.new(product_params)
    if product_type.save
      render json: { message: 'success to insert' }, status: :created
    else
      render json: { message: 'failed inserted' }, status: :unprocessable_entity

    end
  end

  private

  def find_product_type
    @product_type = ProductType.find_by(id: params[:id])
  end

  def product_type_params
    params.require(:product_type).permit(:name)
  end
end
