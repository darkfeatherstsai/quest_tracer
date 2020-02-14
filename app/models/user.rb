class User < ApplicationRecord
  serialize :quest_id,Array

  has_many :quests, dependent: :destroy
  before_save { self.email = email.downcase }
  has_secure_password
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[^@]+@[^@]+\z/}
end
