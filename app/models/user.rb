class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Welcome email activated with a after_create  callback.
  after_create :send_welcome_email
  # has_many :posts, dependent: :destroy
  validates_presence_of :name

  # Method which calls the welcome email from the user mailer passing in the user which
  def send_welcome_email
  	UserMailer.welcome_email(self).deliver_later
  end
end
