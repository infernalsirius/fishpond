class Location < ActiveRecord::Base
  has_many :hardwares
  has_many :servers
end
