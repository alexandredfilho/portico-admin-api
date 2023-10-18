# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
                                 sign_in: 'sign_in',
                                 sign_out: 'sign_out',
                                 registration: 'sign_up'
                               },
                     controllers: {
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                     }

  namespace :api do
    namespace :v1 do
      resources :drivers
      resources :vehicles
      resources :customers
      resources :shipments
    end
  end
end
