class OperatingSystem < ActiveRecord::Base
 has_many :servers
 has_many :hardwares
end
