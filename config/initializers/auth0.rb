Rails.application.config.middleware.use OmniAuth::Builder do
  client_id = Rails.application.credentials.dig :auth0, :client_id
  client_secret = Rails.application.credentials.dig :auth0, :client_secret
  domain = Rails.application.credentials.dig :auth0, :domain
  provider(
      :auth0,
      client_id,
      client_secret,
      domain,
      callback_path: '/auth/auth0/callback',
      authorize_params: {
        scope: 'openid email profile'
      }
    )
  end