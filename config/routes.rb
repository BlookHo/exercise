Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      resources :group_events
      resources :users

      match 'remove',          to: 'group_events#remove',          via: 'delete'
      match 'publish',         to: 'group_events#publish',         via: 'put'
    end
  end
end
