class LogoutController < ApplicationController
    include LogoutHelper
    def logout
      reset_session
      redirect_to root_path
    end
  end