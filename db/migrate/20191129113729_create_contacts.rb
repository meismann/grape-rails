class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :sageone_guid, limit: 32
      t.string :firstname, limit: 255
      t.string :lastname, limit: 127
      t.references :address

      t.timestamps
    end
    add_index :contacts, :sageone_guid
  end
end
