class AddPictureToMircoposts < ActiveRecord::Migration[5.2]
  def change
    add_column :mircoposts, :picture, :string
  end
end
