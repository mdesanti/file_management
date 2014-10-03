class Prod < ActiveRecord::Base
  validates :descri, presence: true
  
  belongs_to :client
end
