MarketPlaceApi::Application.routes.draw do
  #API definition
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api'}, path: '/' do
      #Listing Resources
  end
end
