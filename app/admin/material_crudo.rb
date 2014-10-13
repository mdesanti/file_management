ActiveAdmin.register MaterialCrudo do

  permit_params :client_id, :prod_id, :titulo, :descri,
                :ciudad_id, :barrio_id, :fecha_desde,
                :fecha_hasta, :discurso, :equipo_id,
                :disco_id, :ruta_id, :tipo_id, perrele_ids: []
  
  controller do
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
        onchange: remote_request(:post, change_prod_path, {client_id: "$('#material_crudo_client_id').val()"}, :material_crudo_prod_id)
      }
      f.input :prod_id, label: 'Producto', as: :select, collection: material_crudo.client.present? ? material_crudo.client.prods.map{|u| ["#{u.descri}", u.id]} : []
      f.input :titulo, as: :string
      f.input :tipo_id, label: 'Tipo', as: :select, collection: Tipo.all.map{|u| ["#{u.descri}", u.id]}
      f.input :descri
      f.input :ciudad_id, label: 'Ciudad', as: :select, collection: Ciudad.all.map{|u| [u.descri, u.id]}
      f.input :barrio_id, label: 'Barrio', as: :select, collection: Barrio.all.map{|u| [u.descri, u.id]}
      f.input :fecha_desde
      f.input :fecha_hasta
      f.input :discurso
      f.input :equipo_id, label: 'Equipo', as: :select, collection: Equipo.all.map{|u| ["#{u.descri}", u.id]}
      f.input :disco_id, label: 'Disco', as: :select, collection: Disco.all.map{|u| ["#{u.descri}", u.id]}
      f.input :ruta_id, label: 'Ruta', as: :select, collection: Ruta.all.map{|u| ["#{u.descri}", u.id]}
      f.input :perreles, as: :select, input_html: { class: 'chosen' }, collection: Perrele.all.map{|u| ["#{u.descri}", u.id]}
    end
    f.actions
  end


end
