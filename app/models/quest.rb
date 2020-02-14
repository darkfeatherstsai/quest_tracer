class Quest < ApplicationRecord
  serialize :tags, Array
  validate :quest_validator

  private
  def quest_validator
    if title == ""
      errors[:quest] << "標題不得為空白！！！"
    elsif start_date >= end_date
      errors[:quest] << "結束時間要大於開始時間！！！"
    end
  end
end
