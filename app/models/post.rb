class Post < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true

  validates :title, presence: true, length: { minimum: 2, maximum: 30 }
  validates :content, length: { minimum: 10, maximum: 150 }, allow_blank: false

  # Search methods
  def self.find_by_title(title)
    # Adding .first (or .take in Rails 4) will ensure only one object is returned.
    # where(title: title).take
    where("title LIKE (?)", "%#{title}%")
  end

  def self.find_user_posts_by_title(title, user_id)
    if title.present?
      where("title LIKE (?) AND user_id = (?)", "%#{title}%", "#{user_id}")
    else
      where(title: title, user_id: user_id).take
    end
  end

end
