class Post < ApplicationRecord
  belongs_to :user_account

  validates :content, presence: true
end
