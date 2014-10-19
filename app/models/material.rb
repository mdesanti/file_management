class Material < ActiveRecord::Base
  
  belongs_to :client                                                                                                                                                        
  belongs_to :prod                                                                                                                                                          
  belongs_to :tipo                                                                                                                                                          
  belongs_to :ciudad                                                                                                                                                        
  belongs_to :barrio 
  
  has_and_belongs_to_many :perreles, join_table: 'material_perrele'
  accepts_nested_attributes_for :perreles
    
  has_and_belongs_to_many :tagtemas, join_table: 'material_tagtemas'
  accepts_nested_attributes_for :tagtemas
  
  def self.find_sti_class(type_name)
    case type_name
    when 'raw'
      MaterialCrudo
    when 'finished'
      ProyectoTerminado
    end
  end
end
