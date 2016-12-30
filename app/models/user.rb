class User < ApplicationRecord
  has_many :group_events
  validates_associated :group_events

  before_save { self.email = email.downcase }

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
end
