Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors, only: [:show] do
    resources :patient, only: [:destroy], controller: 'patient_doctors'
  end

  resources :patients, only: [:index]

  resources :hospitals, only: [:show]
end
