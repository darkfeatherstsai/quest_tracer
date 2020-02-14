class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.text :quest_id
      t.boolean :authority, default: 0

      t.timestamps
    end
  end
end
