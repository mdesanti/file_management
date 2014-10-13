FileManagement::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "admin/dashboard#index"
  post '/admin/material_crudos/change_prod' => 'admin/material_crudos#change_prod', as: :change_prod
end
