Rails.application.routes.draw do
  resources :surveys, only: [ :index, :show, :new, :create ] do
    resources :sections, only: [ :show ] do
      resources :questions, only: [ :new, :create ]
      resources :responses, only: [ :create ]
      resources :users, only: [ :show ]
    end
  end

  get "surveys/:survey_id/completion", to: "surveys#completion", as: "survey_completion"
  post "surveys/:survey_id/submit_email", to: "surveys#submit_email", as: "submit_email"

  root "surveys#index"
end
