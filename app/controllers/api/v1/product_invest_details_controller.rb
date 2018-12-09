class Api::V1::ProductInvestDetailsController < ApplicationController
	#before_action :authenticate_user
	before_action :find_proinvdetail, only: [:show]
	
	def show
		if @proinvdetail.present?
			data = @proinvdetail.as_json(include: [:product_invest , :product])
			render json: {
				status: 'OK', results: data, 
				error: nil
			}, status: :ok
		else
			render json: {
				status: 'FAIL', results: nil, error: 'Data not found'
			}, status: :unprocessable_entity
		end
	end

	private

	def find_proinvdetail
		@proinvdetail = ProductInvestDetail.find_by(id: params[:id])
	end

	def proinvdetail_params
		params.require(:proinvdetail).permit(:description, :period, :return_value, :share_periode, :background)
	end
end

 