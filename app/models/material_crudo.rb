class MaterialCrudo < ActiveRecord::Base
  belongs_to :client
  belongs_to :prod
  belongs_to :tipo
  belongs_to :ciudad
  belongs_to :barrio
  belongs_to :equipo
  belongs_to :disco
  belongs_to :ruta
  
  has_and_belongs_to_many :perreles, join_table: 'material_crudo_perrele'
  accepts_nested_attributes_for :perreles
end
