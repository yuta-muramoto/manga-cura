class CreateWriting < ActiveRecord::Migration
  def change
    create_table :writing do |t|
      t.references :comic, index: true, foreign_key: true
      t.references :author, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
