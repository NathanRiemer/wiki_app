class Article < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :revisions, dependent: :destroy
  validates :title, uniqueness: true
end
