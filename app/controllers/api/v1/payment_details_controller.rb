# frozen_string_literal: true

class Api::V1::PaymentDetailsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    paydetail = PaymentDetail.all
    if paydetail.present?
      render json: paydetail, status: :ok
    else
      render json: { message_error: 'PaymentDetails not found' }, status: :unprocessable_entity
    end
 end

  def show
    #find_PaymentDetail
    #@paydetail =PaymentDetail.find(params[:id])
    if @paydetail.present?
      render json: @paydetail, status: :ok
    else
      render json: { message_error: 'PaymentDetails not found' }, status: :unprocessable_entity
    end
  end

  def destroy
    find_PaymentDetail
    if @paydetail.destroy!
      render json: { message: 'success deleted PaymentDetails' }, status: :ok

      def destroy
        @paydetail = PaymentDetail.find(params[:id])
        @paydetail.destroy

        redirect_to action: :destroy
      end
    else
      render json: { message: 'failed deleted PaymentDetails' }, status: :unprocessable_entity
    end
  end


    def create
      @paydetail = PaymentDetail.new(params[:paydetail])
      if @paydetail.save
         redirect_to :action => 'list'
      else
         @paydetail = Subject.find(:all)
         render :action => 'new'
      end
   end

   def update
     @paydetail = PaymentDetail.find(params[:id])

    if @paydetail.update(payment_detail_params)
      render json: { status: 'OK', msg: 'Payment Detail have been updated', error:'nill', }
    else
      not_good
    end
    end


  def create
    @paydetail = PaymentDetail.new(payment_details_params)
    if @paydetail.save
      render json: {message: 'success to insert'}, status: :created
    else
      render json: {message: 'failed inserted'}, status: :unprocessable_entity
      end
  end

  private

  def find_PaymentDetail
    @paydetail = PaymentDetail.find_by(id: params[:id])
  end

  def not_good
    render json: { message: 'failed' }
  end

  def payment_detail_params
    params.require(:paymentdetail).permit(:card_number, :card_valid_date, :cvv)
  end
end
