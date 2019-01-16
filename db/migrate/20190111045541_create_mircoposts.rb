class CreateMircoposts < ActiveRecord::Migration[5.2]
  def change
    create_table :mircoposts do |t|
      t.text :content
      t.references :user, foreign: true

      t.timestamps
    end
    add_index :mircoposts, [:user_id, :created_at]
  end
end
