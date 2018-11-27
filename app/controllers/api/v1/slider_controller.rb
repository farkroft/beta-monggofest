class Api::V1::SliderController < ApplicationController
    before_action :verify_authenticity_token, except: [:index,:create,:show,:update,:destroy]
    before_action :find_slider, only: %i[destroy show update]

# method to create API to show all slider from table
  def index
    sliders = Slider.all
    if sliders.present?
      render json: {
        status: 'OK', results: sliders, error: nil
      }, status: :ok
    else
      render json: {
        status: 'FAIL', results: nil, error: 'Data is empty'
      }, status: :unprocessable_entity
    end
  end

# method to save new slider
  def create
    slider = Slider.new(slider_params)
    if slider.save
      render json: {
        status: 'OK', results: slider, error: nil
      }, status: :created
    else
      render json: {
        status: 'FAIL', results: nil, error: 'data fail created'
      }, status: :unprocessable_entity
    end
  end

# method to show specific slider
  def show
    if @slider.present?
      render json: {
        status: 'OK', results: @slider, error: nil
      }, status: :ok
    else
      render json: {
        status: 'FAIL', results: nil, error: 'Data not found'
      }, status: :unprocessable_entity
    end
  end

# method to update slider that have exist
  def update
    update_slider = @slider.update(slider_params)
    if update_slider
      render json: {
        status: 'OK', results: update_slider, error: nil
      }, status: :ok
    else
      render json: {
        status: 'FAIL', results: nil, error: 'Data fail to update'
      }, status: :unprocessable_entity
    end
  end

# method to delete slider base on id
  def destroy
    if @slider
      @slider.destroy!
      render json: {
        status: 'OK', results: 'Delete success', error: nil
      }, status: :ok
    else
      render json: {
        status: 'FAIL', results: nil, error: 'Delete fail'
      }
    end
  end

  private

  def find_slider
    @slider = Slider.find(params[:id])
  end

  def slider_params
    params.require(:slider).permit(:name, :img, :url, :sort_number, :isActive)
  end
end
