class User < ActiveRecord::Base
  include BCrypt

  has_many :rounds

  validates :username, :email, :password_hash, presence: true
  validates_uniqueness_of :email
  validate :valid_email_format

  def valid_email_format
    if (email =~ /^[a-zA-Z0-9]*@.*\.com$/).nil?
      errors.add(:email_error, ":you need a format XXXXXX@example.com where the Xs are numbers or letters")
    end
  end


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
