class User < ApplicationRecord
  has_secure_password

  validates :first_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  before_save :downcase_email

  def downcase_email
    self.email = email.downcase
  end
end
