class Backup < ActiveRecord::Base
  validates :descri, presence: true
end
