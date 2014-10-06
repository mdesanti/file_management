ActiveAdmin.register Disco do
 permit_params :descri 

  menu :parent => "Tablas",:label => "Disco"   
  config.sort_order = "descri_asc"
  breadcrumb do
      params[:action]=='index' ? [] : []
  end
  
  action_item :only => :show do
    link_to "Volver", admin_discos_path
  end
    
 # sidebar 'Productos de este cliente', :only => :show do
 #     table_for Prod.joins(:client).where(:client_id=> Client.id) do |t|
 #         t.column("Descripción") { |prod| prod.descri }
 #   end
 # end  
    
  index :title => 'Disco' do
    selectable_column
    column 'Descripción', :descri
    actions
  end
  
  filter :descri, :label => 'Descripción'
      
  controller do
    def edit
        @page_title = 'Editar Disco'
    end
  end
    
  form do |f|
    f.inputs "Detalles" do
      f.input :descri, :label => 'Descripción'
      
    end
    f.actions
  end
    
  show :title => 'Disco' do
    panel 'Detalles' do
      attributes_table_for Disco do
        row 'Descripción' do
            disco.descri
        end 
      end
    end
  end
    end
