# frozen_string_literal: true

class ApplicationController < ActionController::Base
<<<<<<< HEAD
	protect_from_forgery with: :null_session	
=======
  protect_from_forgery with: :null_session
  # Include Knock within your application.

  include Knock::Authenticable
>>>>>>> cb19d3b005146891e8af2f03ea124906efa98627
end
