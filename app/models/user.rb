class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :full_name, type: String
  field :email, type: String
  field :password_digest, :type => String
  field :location, type: String
  field :bio, type: String

  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  validates_presence_of :email, :full_name, :location
  validates_length_of :bio, minimun: 30, allow_blank: false
  validate :email_format

  has_secure_password

  private

  def email_format
    errors.add(:email, :invalid) unless  email.match(EMAIL_REGEXP)
  end


end
