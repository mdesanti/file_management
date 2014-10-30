ActiveAdmin.register Material do
  config.clear_action_items!  
  
  menu :label => "Materiales Crudos y Proyectos Terminados", priority: 1
  breadcrumb do
    params[:action]=='index' ? [] : []
  end  
    
  config.sort_order = "clients.name_asc"  
  
  controller do
       
    def scoped_collection
     Material.includes(:client, :prod)
    end
    
   # def change_prod
   #   if params[:client_id].empty?
   #     @prods = []
   #   else
   #     @prods = Client.find_by_id(params[:client_id]).prods
   #   end
   #   render text: view_context.options_from_collection_for_select(@prods, :id, :descri)
   # end  
    
  end
  
  index :title => 'Materiales Crudos y Proyectos Terminados' do |mc|
    selectable_column
    column 'Cliente', :client_id, :sortable => 'clients.name' do |t| 
      t.client.name 
    end
    column 'Producto', :prod_id, :sortable => 'prods.descri' do |t|
      t.prod.descri unless t.prod.blank?
    end  
    column 'Título', :titulo
    column 'Tipo', :tipo_id, :sortable => 'tipos.descri' do |t|
      t.tipo.descri unless t.tipo.blank?
    end 
    column 'Descripción', :descri  unless blank?
    column 'Ciudad', :ciudad_id, :sortable => 'ciudads.descri' do |t|
      t.ciudad.descri unless t.ciudad.blank?
    end 
    column 'Barrio', :barrio_id, :sortable => 'barrios.descri' do |t|
      t.barrio.descri unless t.barrio.blank?
    end 
    column 'Discurso', :discurso  
    column 'M.C./P.T.',  :type do |t| # =='raw' ? 'M.Crudo' : 'P.Terminado'  
      if t.type=='raw' then
        'M.Crudo'
      else
        'P.Terminado'
      end
    end
    #actions defaults: false, dropdown: true, dropdown_name: 'Acciones' do |t|
    # if t.type=='raw' then    
    #   item "Ver",admin_material_crudo_path(t)
    #   item "Editar",edit_admin_material_crudo_path(t)
    # else
    #   item "Ver",admin_proyecto_terminado_path(t)
    #   item "Editar",edit_admin_proyecto_terminado_path(t)
    # end
    #end
    actions defaults: false do |t|    
     if t.type=='raw' then  
      link_to "Ver",admin_material_crudo_path(t)
     else
      link_to "Ver",admin_proyecto_terminado_path(t)   
     end
    end
    actions defaults: false do |t|  
     if t.type=='raw' then  
      link_to "Editar",edit_admin_material_crudo_path(t)
     else
      link_to "Editar",edit_admin_proyecto_terminado_path(t)   
     end
    end
  end
    
  filter :tagtemas, as: :select, collection: Tagtemas.all.map{|u| ["#{u.descri}", u.id]}, multiple: true, input_html: { class: 'chosen' }
end