class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :category_name, limit: 50
      t.string :description, limit: 250
      t.string :picture
      t.timestamps
    end
  end
end
