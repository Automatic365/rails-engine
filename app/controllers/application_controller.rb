class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
<<<<<<< HEAD

  # helper_method :request_params
  #
  # def request_params
  #   find_by(requst.query_parameters)
=======
  
  # helper_method :request_params
  # 
  # def request_params
  #   find_by(request.query_parameters)
>>>>>>> development
  # end
end
