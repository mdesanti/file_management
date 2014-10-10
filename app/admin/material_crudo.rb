ActiveAdmin.register MaterialCrudo do

  permit_params :client_id, :prod_id, :titulo, :descri,
                :ciudad_id, :barrio_id, :fecha_desde,
                :fecha_hasta, :discurso, :equipo_id,
                :disco_id, :ruta_id, :tipo_id, perrele_ids: []

  form do |f|
    f.inputs "Detalles" do
      f.input :client_id, label: 'Cliente', as: :select, collection: Client.all.map{|u| ["#{u.name}", u.id]}
      f.input :prod_id, label: 'Producto', as: :select, collection: Prod.all.map{|u| ["#{u.descri}", u.id]}
      f.input :titulo, as: :string
      f.input :tipo_id, label: 'Tipo', as: :select, collection: Tipo.all.map{|u| ["#{u.descri}", u.id]}
      f.input :descri
      f.input :ciudad_id, label: 'Ciudad', as: :select, collection: Ciudad.all.map{|u| ["#{u.descri}", u.id]}
      f.input :barrio_id, label: 'Barrio', as: :select, collection: Barrio.all.map{|u| ["#{u.descri}", u.id]}
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
