class AddQuestTags < ActiveRecord::Migration[5.2]
  def change
    add_column :quests, :tags, :text
  end
end
