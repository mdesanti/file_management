ActiveAdmin.register Tagtemas do
 permit_params :descri 

  menu :parent => "Tablas",:label => "Tag Temas"   
  config.sort_order = "descri_asc"
  breadcrumb do
      params[:action]=='index' ? [] : []
  end
  
  action_item :only => :show do
      link_to "Volver", admin_tagtemas_index_path
  end
     
  index :title => 'Tag Temas' do
    selectable_column
    column 'Descripción', :descri
    actions
  end
  
  filter :descri, :label => 'Descripción'
      
  controller do
    def edit
        @page_title = 'Editar Tag Temas'
    end
  end
    
  form do |f|
    f.inputs "Detalles" do
      f.input :descri, :label => 'Descripción'
      
    end
    f.actions
  end
    
  show :title => 'Tag Temas' do
    panel 'Detalles' do
      attributes_table_for Tagtemas do
        row 'Descripción' do
          tagtemas.descri
        end 
      end
    end
  end    
end
