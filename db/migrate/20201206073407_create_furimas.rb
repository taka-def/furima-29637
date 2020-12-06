class CreateFurimas < ActiveRecord::Migration[6.0]
  def change
    create_table :furimas do |t|
      t.string :users
      t.string :tweets
      t.text :comments
      t.timestamps
    end
  end
end
