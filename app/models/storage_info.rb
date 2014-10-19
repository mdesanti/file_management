class StorageInfo < ActiveRecord::Base
  belongs_to :equipo
  belongs_to :disco
  belongs_to :ruta
  belongs_to :material
end
