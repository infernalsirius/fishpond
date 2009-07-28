class Accessory < ActiveRecord::Base
  belongs_to :harware
  belongs_to :server
end
