MarketPlaceApi::Application.routes.draw do
  #API definition
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api'}, path: '/raco' do
    scope module:  :v1 do
      #Listing Resources
    end
  end
end
