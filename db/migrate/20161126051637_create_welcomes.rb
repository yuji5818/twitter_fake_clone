class CreateWelcomes < ActiveRecord::Migration
  def change
    create_table :welcomes do |t|
      t.text :content
      t.timestamps null: false
    end
  end
end
