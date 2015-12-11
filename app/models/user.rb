class User < ActiveRecord::Base
  has_secure_password
  has_many :comments
  has_many :revisions
  has_many :articles, through: :revisions
  validates :username, uniqueness: true
  validates :email, uniqueness: true
end
