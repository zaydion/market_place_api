require 'api_constraints'

MarketPlaceApi::Application.routes.draw do
  #API definition
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api'}, path: '/raco' do
    scope module:  :v1,
      constraints: ApiConstraints.new(version: 1, default: true) do
      #Listing Resources
    end
  end
end
