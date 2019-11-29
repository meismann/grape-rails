class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :sageone_guid, limit: 32
      t.string :street, limit: 255
      t.string :postcode, limit: 16
      t.references :country

      t.timestamps
    end
    add_index :addresses, :sageone_guid
  end
end
