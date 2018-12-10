class Api::V1::ProductsController < ApplicationController
    # skip_before_action :verify_authenticity_token
before_action :verify_authenticity_token, except: [:index]
before_action :find_product, only: %i[destroy show update]

# method to create API to show all product from table
def index
product = Product.all
if product.present?
  render json: {
    status: 'OK', results: product, error: nil
  }, status: :ok
else
  render json: {
    status: 'FAIL', results: nil, error: 'Data is empty'
  }, status: :unprocessable_entity
end
end

# method to save new product
def create
product = Product.new(product_params)
if product.save
  product.reload
  render json: {
    status: 'OK', results: product, error: nil
  }, status: :created
else
  render json: {
    status: 'FAIL', results: nil, error: 'data fail created'
  }, status: :unprocessable_entity
end
end

# method to show specific product
def show
if @product.present?
  render json: {
    status: 'OK', results: @product, error: nil
  }, status: :ok
else
  render json: {
    status: 'FAIL', results: nil, error: 'Data not found'
  }, status: :unprocessable_entity
end
end

# method to update product that have exist
def update
@product = Product.find(params[:id])
update_product = @product.update(product_params)
if update_product
  render json: {
    status: 'OK', results: update_product, error: nil
  }, status: :ok
else
  render json: {
    status: 'FAIL', results: nil, error: 'Data fail to update'
  }, status: :unprocessable_entity
end
end

# method to delete product base on id
def destroy
if @product = Product.find(params[:id])
  @product.destroy!
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

def find_product
@product = Product.find(params[:id])
end

def product_params
params.permit(:kecamatan_id, :product_type_id, :name, :photo, :url)
end
end
