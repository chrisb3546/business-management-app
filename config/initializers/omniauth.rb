Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['google_client_key'], ENV['google_client_secret']
  end