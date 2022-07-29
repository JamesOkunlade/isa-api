require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web, at: "/sidekiq"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  # Namespace the controller without affecting the URI
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    get "listjobs", to: "jobs#list_jobs"
    post "createjob", to: "jobs#create"
  end
end
