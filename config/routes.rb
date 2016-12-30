Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      resources :group_events
      resources :users

      match 'events_of_user',  to: 'group_events#events_of_user',  via: 'get'
      match 'remove',          to: 'group_events#remove',          via: 'get'
      match 'publish',         to: 'group_events#publish',         via: 'get'
    end
  end
end
