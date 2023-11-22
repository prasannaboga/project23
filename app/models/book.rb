class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: true }
  validates :description, presence: true
  validates :published_at, presence: true

  def create_comment
    abc = "New Comment"
    abc.gsub("New", "---")
  end

  def add(x, y)
    x1 = x
    y1 = y

    x1 = x + 1 if x == 2

    x1 + y1
  end
end
