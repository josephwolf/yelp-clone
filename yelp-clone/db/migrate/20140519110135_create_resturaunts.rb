class CreateResturaunts < ActiveRecord::Migration
  def change
    create_table :resturaunts do |t|
      t.string :name
      t.text :address

      t.timestamps
    end
  end
end
