class Api::V1::ProvincesController < ApplicationController
    before_action :set_province, only: [:show, :edit, :update, :destroy]
    protect_from_forgery with: :null_session
 
    def index
        @prov = Province.all
        if @prov.present?
             render json:  @prov     
            else
                render json: {message_error: 'province null'}, status: :unprocessable_entity
        end
    end
    
end

