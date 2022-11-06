# frozen_string_literal: true

Rails.application.routes.draw do
  root "pages#main"
  post '/update_payment', to: 'pages#update_payment'
end
