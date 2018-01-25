Rails.application.routes.draw do
  post '/shipments' => 'shipments#index'
end
