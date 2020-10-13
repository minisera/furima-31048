class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,null: false, foreign_key: true
      t.string :name,null: false
      t.text :comment,null: false
      t.integer :price,null: false
      t.integer :status_id,null: false
      t.integer :category_id,null: false
      t.integer :source_id,null: false
      t.integer :charge_id,null: false
      t.integer :day_id,null: false
      t.timestamps
    end
  end
end
