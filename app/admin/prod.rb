ActiveAdmin.register Prod do
  permit_params :client_id, :descri
  config.sort_order = "descri_asc"
  menu :parent => "Tablas",:label => "Productos"
    
  breadcrumb do
   params[:action]=='index' ? [] : []
  end
    
  action_item :only => :show do
    link_to "Volver", admin_prods_path
  end
    
  index :title => 'Productos' do
   column 'Descripción', :descri
   column 'Cliente', :id do |t|
      t.client.name
   end
   actions
  end
  
  filter :client, :label => 'Razón Social', as: :select, collection: Client.order(:name)
  filter :descri, :label => 'Descripción'

  controller do
    def edit
        @page_title = 'Editar Productos'
    end
  end
    
  form do |f|  
    f.inputs "Detalles" do
      f.input :client, :label => 'Razón Social', :as => :select, :collection => Client.all  
      f.input :descri, :label => 'Descripción'
    end
    f.actions
  end  
  
  show :title => 'Consulta de Productos' do
    #panel 'Detalles' do
      attributes_table do
        row 'Razón Social', :id do |t|
             t.client.name
        end
        row 'Descripción' do
             prod.descri
        end
      end
    #end
  end
end
