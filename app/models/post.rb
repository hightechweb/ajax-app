class Post < ActiveRecord::Base
  # validates_presence_of :title

  validates :title, presence: true, length: { minimum: 2, maximum: 30 }
  validates :content, length: { minimum: 10, maximum: 150 }, allow_blank: false
end
