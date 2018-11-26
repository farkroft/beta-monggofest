class Api::V1::ProductsController < ApplicationController
    # frozen_string_literal: true
    before_action :find_product, only: [:destroy, :show]
  def index
    product = Product.all
    if product.present?
        render json: product, status: :ok
    else
    render json: {message_error: 'product not found'}, status: :unprocessable_entity
    end
  end

  def show
    if @product.present?
        render json: @product, status: :ok
    else
        render json:{message_error: 'product not found'}, status: :unprocessable_entity
    end
  end

  def destroy
    if @product
      @product.destroy!
      render json: { message: 'success deleted product' }, status: :ok
    else
      render json: { message: 'failed deleted product' }, status: :unprocessable_entity
    end
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: { message: 'success to insert' }, status: :created
    else
      render json: { message: 'failed inserted' }, status: :unprocessable_entity

    end
  end

  private

  def find_product
    @product = Product.find_by(id: params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock)
  end
end

