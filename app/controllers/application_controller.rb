class ApplicationController < ActionController::Base
  helper_method :is_logged_in?
  

  private
    def is_logged_in?
      true
    end
end
