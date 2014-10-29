ActiveAdmin.register ProyectoTerminado do
     
  permit_params :client_id, :prod_id, :titulo, :descri,
                :ciudad_id, :barrio_id, :fecha_desde,
                :fecha_hasta, :discurso, :tipo_id, perrele_ids: [], tagtemas_ids: [], storage_infos_attributes: [:equipo_id, :disco_id, :ruta_id]
  
  breadcrumb do
    params[:action]=='index' ? [] : []
  end
  
  config.sort_order = "clients.name_asc"
  
  action_item :only => :show do
    link_to "Volver", admin_material_crudos_path
  end
    
  index :title => 'Material Crudo' do |mc|
   selectable_column
    column 'Cliente', :client_id, :sortable => 'clients.name' do |t| 
     t.client.name 
   end
   column 'Producto', :prod_id, :sortable => 'prods.descri' do |t|
     t.prod.descri unless t.prod.blank?
   end  
   column 'Título', :titulo
   column 'Descripción', :descri  unless blank?
   actions
  end
    
  filter :client, :label => 'Razón Social', as: :select, collection: Client.order(:name)
  filter :prod_descri, :label => 'Producto', as: :string
  filter :tagtemas, as: :select, collection: Tagtemas.all.map{|u| ["#{u.descri}", u.id]}, multiple: true, input_html: { class: 'chosen' }
    
  controller do
    
    #def edit
    #  @page_title= 'Sandra'
    #end
    
    def scoped_collection
      ProyectoTerminado.includes(:client, :prod)
    end
    
    def change_prod
      if params[:client_id].empty?
        @prods = []
      else
        @prods = Client.find_by_id(params[:client_id]).prods
      end
      render text: view_context.options_from_collection_for_select(@prods, :id, :descri)
    end  
    
  end

  form do |f|
    f.inputs "Detalles" do
      f.input :client_id, label: 'Cliente', as: :select, collection: Client.all.map{|u| ["#{u.name}", u.id]}, input_html: {
        onchange: remote_request(:post, change_prod_path, {client_id: "$('#proyecto_terminado_client_id').val()"}, :proyecto_terminado_prod_id)
      }
      f.input :prod_id, label: 'Producto', as: :select, collection: proyecto_terminado.client.present? ? proyecto_terminado.client.prods.map{|u| ["#{u.descri}", u.id]} : []
      f.input :titulo, as: :string
      f.input :tipo_id, label: 'Tipo', as: :select, collection: Tipo.all.map{|u| ["#{u.descri}", u.id]}
      f.input :descri, as: :string
      f.input :ciudad_id, label: 'Ciudad', as: :select, collection: Ciudad.all.map{|u| [u.descri, u.id]}
      f.input :barrio_id, label: 'Barrio', as: :select, collection: Barrio.all.map{|u| [u.descri, u.id]}
      f.input :fecha_desde, as: :date_picker, :input_html => { :value => Date.today}
      f.input :fecha_hasta, as: :date_picker
      f.input :discurso
      f.has_many :storage_infos do |sf|
        sf.input :equipo_id, label: 'Equipo', as: :select, collection: Equipo.all.map{|u| ["#{u.descri}", u.id]}
        sf.input :disco_id, label: 'Disco', as: :select, collection: Disco.all.map{|u| ["#{u.descri}", u.id]}
        sf.input :ruta_id, label: 'Ruta', as: :select, collection: Ruta.all.map{|u| ["#{u.descri}", u.id]}
      end
      f.input :tagtemas, as: :select, input_html: { class: 'chosen' }, collection: Tagtemas.all.map{|u| ["#{u.descri}", u.id]}
      f.input :perreles, as: :select, input_html: { class: 'chosen' }, collection: Perrele.all.map{|u| ["#{u.descri}", u.id]}
    end
    f.actions
  end
 
  show :title => 'Consulta de Proyecto Terminado' do |pt|
    attributes_table do
      row 'Cliente', :id do |t|
        t.client.name
      end
      row 'Producto', :id do |t|
        t.prod.descri unless t.prod.blank?
      end
      row 'Título' do
        proyecto_terminado.titulo
      end 
      row 'Tipo', :id do |t|
        t.tipo.descri unless t.tipo.blank?
      end
      row 'Descripción' do 
        proyecto_terminado.descri
      end
      row 'Ciudad', :id do |t|
        t.ciudad.descri unless t.ciudad.blank?
      end 
      row 'Barrio', :id do |t|
        t.barrio.descri unless t.barrio.blank?
      end 
      row 'Desde' do
        proyecto_terminado.fecha_desde.strftime('%d/%m/%Y')
      end   
      row 'Hasta' do
        proyecto_terminado.fecha_hasta.strftime('%d/%m/%Y') unless proyecto_terminado.fecha_hasta.blank?
      end   
      row 'Discurso', :id do |t|
        proyecto_terminado.discurso unless proyecto_terminado.discurso.blank?
      end
      row 'Tag Temas' do 
          pt.tagtemas.map(&:descri).join("<br />").html_safe
      end  
      row 'Personas Relevantes' do 
        pt.perreles.map(&:descri).join("<br />").html_safe
      end   
    end
    panel "Información de almacenamiento" do
      table_for pt.storage_infos do
        column "Equipo" do |sf|
          sf.equipo.descri unless sf.blank? || sf.equipo.blank?
        end
        column "Disco" do |sf|
          sf.disco.descri unless sf.blank? || sf.disco.blank?
        end
        column "Ruta" do |sf|
          sf.ruta.descri unless sf.blank? || sf.ruta.blank?
        end
      end
    end
  end  

end
