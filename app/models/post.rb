class Post < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  
  validates :title, presence: true, length: { minimum: 2, maximum: 30 }
  validates :content, length: { minimum: 10, maximum: 150 }, allow_blank: false
end
