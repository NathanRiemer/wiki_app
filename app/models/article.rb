class Article < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :revisions, dependent: :destroy
  validates :title, uniqueness: true

  def current_rev
    revisions.last
  end

  def current_content
    current_rev.content
  end

  def current_image
    current_rev.image_url
  end

  def current_author
    current_rev.user
  end

  def first_rev
    revisions.first
  end
end
