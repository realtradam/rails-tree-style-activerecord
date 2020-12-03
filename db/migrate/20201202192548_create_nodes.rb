class CreateNodes < ActiveRecord::Migration[6.0]
  def change
    create_table :nodes do |t|
      t.string :title
      t.text :content
      t.references :parent, index: true

      t.timestamps null: false
    end
  end
end
