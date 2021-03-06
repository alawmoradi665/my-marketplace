class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.integer :price
      t.text :description
      t.text :measurements
      t.boolean :shipping
      t.string :availability
      t.string :state
      t.string :city
      t.string :suburb

      t.timestamps
    end
  end
end
