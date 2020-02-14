class CreateQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :quests do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.datetime :start_date
      t.datetime :end_date
      t.integer :priority
      t.integer :state

      t.timestamps
    end
  end
end
