class Api::V1::ProvincesController < ApplicationController
    before_action :find_province, only: [:destroy, :show]
  def index
    province = Province.all
    if province.present?
        render json: province, status: :ok
    else
    render json: {message_error: 'province not found'}, status: :unprocessable_entity
    end
  end

  def show
    if @province.present?
        render json: @province, status: :ok
    else
        render json:{message_error: 'province not found'}, status: :unprocessable_entity
    end
  end

  def destroy
    if @province
      @province.destroy!
      render json: { message: 'success deleted province' }, status: :ok
    else
      render json: { message: 'failed deleted province' }, status: :unprocessable_entity
    end
  end

  def create
    province = Province.new(province_params)
    if province.save
      render json: { message: 'success to insert' }, status: :created
    else
      render json: { message: 'failed inserted' }, status: :unprocessable_entity

    end
  end

  private

  def find_province
    @province = Province.find_by(id: params[:id])
  end

  def province_params
    params.require(:province).permit(:name)
  end
end
