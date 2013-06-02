class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  validates :name, presence: true, length: { maximum: 50 }
  has_many :microposts, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
            uniqueness: { case_sensitive: false }

  before_save { self.email = email.downcase }
  before_save :create_remember_token

  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true 

  def feed
    Micropost.where("user_id = ?", self.id)
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
