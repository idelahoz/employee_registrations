Rails.application.routes.draw do
  namespace :admin do
    resources :employee_registration, only: :create
  end
end
