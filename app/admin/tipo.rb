ActiveAdmin.register Tipo do
 permit_params :descri 

  menu :parent => "Tablas",:label => "Tipo"   
  config.sort_order = "descri_asc"
  breadcrumb do
      params[:action]=='index' ? [] : []
  end
  
   action_item :only => :show do
    link_to "Añadir", new_admin_tipo_path
  end
  action_item :only => :show do
    link_to "Volver", admin_tipos_path
  end
 
    
 # sidebar 'Productos de este cliente', :only => :show do
 #     table_for Prod.joins(:client).where(:client_id=> Client.id) do |t|
 #         t.column("Descripción") { |prod| prod.descri }
 #   end
 # end  
    
  index :title => 'Tipo' do
    selectable_column
    column 'Descripción', :descri
    actions
  end
  
  filter :descri, :label => 'Descripción'
      
  controller do
    def edit
        @page_title = 'Editar Tipo'
    end
  end
    
  form do |f|
    f.inputs "Detalles" do
      f.input :descri, :label => 'Descripción'
      
    end
    f.actions
  end
    
  show :title => 'Tipo' do
    panel 'Detalles' do
      attributes_table_for Tipo do
        row 'Descripción' do
          tipo.descri
        end 
      end
    end
  end
end
