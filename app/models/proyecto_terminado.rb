class ProyectoTerminado < Material
  has_many :storage_infos, foreign_key: :material_id
  
  accepts_nested_attributes_for :storage_infos
  
  class << self
    def sti_name
      "finished"
    end
  end
end