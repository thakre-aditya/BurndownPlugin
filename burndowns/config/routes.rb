# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
    get 'burndowns', to: 'burndowns#index'
    # get 'issues_count_per_day', to: 'burndowns#issues_count_per_day'
  end