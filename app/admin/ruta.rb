ActiveAdmin.register Ruta do
 permit_params :descri 

  menu :parent => "Tablas",:label => "Ruta"   
  config.sort_order = "descri_asc"
  breadcrumb do
      params[:action]=='index' ? [] : []
  end
  
  action_item :only => :show do
      link_to "Volver", admin_ruta_path
  end
    
 # sidebar 'Productos de este cliente', :only => :show do
 #     table_for Prod.joins(:client).where(:client_id=> Client.id) do |t|
 #         t.column("Descripción") { |prod| prod.descri }
 #   end
 # end  
    
  index :title => 'Ruta' do
    selectable_column
    column 'Descripción', :descri
    actions
  end
  
  filter :descri, :label => 'Descripción'
      
  controller do
    def edit
        @page_title = 'Editar Ruta'
    end
  end
    
  form do |f|
    f.inputs "Detalles" do
      f.input :descri, :label => 'Descripción'
      
    end
    f.actions
  end
    
  show :title => 'Ruta' do
    panel 'Detalles' do
      attributes_table_for Ruta do
        row 'Descripción' do
          ruta.descri
        end 
      end
    end
  end    
end
