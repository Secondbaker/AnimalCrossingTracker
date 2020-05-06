class Auth0Controller < ApplicationController
    def callback
      # This stores all the user information that came from Auth0
      # and the IdP
      session[:userinfo] = request.env['omniauth.auth']
  
      # Redirect to the URL you want after successful auth
      if User.find_by(auth0_id: session[:userinfo]['uid'])
        redirect_to '/island_collections'
      else
        redirect_to new_user_path
      end
    end
  
    def failure
      # show a failure page or redirect to an error page
      @error_msg = request.params['message']
    end
  end