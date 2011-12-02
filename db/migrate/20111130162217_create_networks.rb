class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :network
      t.string :typenetwork

      t.timestamps
    end
  end
end
