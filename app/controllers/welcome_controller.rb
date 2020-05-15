class WelcomeController < ApplicationController
  def index
    if session[:userinfo]
      redirect_to island_collections_path
    end
  end
end
