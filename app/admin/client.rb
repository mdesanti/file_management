ActiveAdmin.register Client do
  permit_params :name, :description

  menu :parent => "Tablas",:label => "Clientes"   
  config.sort_order = "name_asc"
  breadcrumb do
      params[:action]=='index' ? [] : []
  end
  
  action_item :only => :show do
      link_to "Volver", admin_clients_path
  end
    
 # sidebar 'Productos de este cliente', :only => :show do
 #     table_for Prod.joins(:client).where(:client_id=> Client.id) do |t|
 #         t.column("Descripción") { |prod| prod.descri }
 #   end
 # end  
    
  index :title => 'Clientes' do
    selectable_column
    column 'Razón Social', :name
    column 'Observaciones', :description
    column 'Productos' do |client|
      link_to 'Ver', admin_prods_path('q[client_id_eq]' => client.id)
    end
    actions
  end
  
  filter :name, :label => 'Razón Social'
  filter :description, :label => 'Observaciones'
    
  controller do
    def edit
        @page_title = 'Editar Clientes'
    end
  end
    
  form do |f|
      f.inputs "Detalles" do
      f.input :name, :label => 'Razón Social'
      f.input :description, :label => 'Observaciones'
    end
    f.actions
  end
    
  show :title => :name do
    panel 'Detalles' do
        attributes_table_for Client do
        row 'Razón Social' do
          client.name
        end
        row 'Observaciones' do
          client.description
        end
        
      end
    end
  end
    
end
