class ModifyLicenseTable < ActiveRecord::Migration
  def self.up
    change_table :licenses do |t|
      t.change :version, :string
    end
  end

  def self.down
    change_table :licenses do |t|
    end
  end
end
