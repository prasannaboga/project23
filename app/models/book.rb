class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: true }
  validates :description, presence: true
  validates :published_at, presence: true

  around_create :create_mongodb_book

  def create_comment
    abc = "New Comment"
    abc.gsub("New", "---")
  end

  def sub
    a = 1
    b = 2
    c = x + y
  end

  def add(x, y)
    x1 = x
    y1 = y

    x1 = x + 1 if x == 2

    x1 + y1
  end

  def create_mongodb_book
    ActiveRecord::Base.transaction do
      yield

      mongo_book = Mongodb::Book.first_or_initialize(book_id: id)
      mongo_book.book_id = id
      mongo_book.update(attributes.except("created_at", "updated_at", "id"))
      mongo_book.save
    end
  end
end
