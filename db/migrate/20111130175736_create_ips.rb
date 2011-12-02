class CreateIps < ActiveRecord::Migration
  def change
    create_table :ips do |t|
      t.string :ipaddress
      t.string :status

      t.timestamps
    end
  end
end
