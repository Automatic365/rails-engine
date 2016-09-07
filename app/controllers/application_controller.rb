class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  # helper_method :request_params
  #
  # def request_params
  #   find_by(requst.query_parameters)
  # end
end
