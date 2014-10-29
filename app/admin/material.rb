ActiveAdmin.register Material do
  filter :tagtemas, as: :select, collection: Tagtemas.all.map{|u| ["#{u.descri}", u.id]}, multiple: true, input_html: { class: 'chosen' }
end