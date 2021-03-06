class MaterialCrudo < Material
  
  has_one :storage_info, foreign_key: :material_id
  
  accepts_nested_attributes_for :storage_info, allow_destroy: true
   
  class << self
    def sti_name
      "raw"
    end
  end
end