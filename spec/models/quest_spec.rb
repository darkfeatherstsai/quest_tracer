require 'rails_helper'

RSpec.describe Quest, type: :model do
  describe "任務管理器基本功能" do
    it "新增任務" do
      quest = Quest.new(id: 0, title: "test", content: "測試用", user_id: 0)
      expect(quest.save).to be true
    end
    it "編輯任務" do

    end
    it "刪除任務" do 

    end
  end
end
