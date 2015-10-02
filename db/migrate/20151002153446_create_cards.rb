class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :term, null: false
      t.text :definition, null: false
      t.integer :deck_id, null: false
      t.timestamps null: false
    end
  end
end
