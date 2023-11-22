class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: true }
  validates :description, presence: true
  validates :published_at, presence: true

  def create_comment
    abc = "New Comment"
    abc.gsub("New", "---")
  end
end
