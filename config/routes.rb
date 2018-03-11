Ares::Rails::Engine.routes.draw do
  get '/cron/:id', to: "crons#show", as: :cron
end