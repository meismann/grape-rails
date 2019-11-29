class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :code, limit: 2

      t.timestamps
    end
    add_index :countries, :code
  end
end
