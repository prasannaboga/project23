require "rails_helper"

RSpec.describe Book, type: :model do
  describe "#validation" do
    it "should no errors for valid attributes" do
      book = Book.new(title: "Title1", description: "Description1", published_at: "2023-01-03")
      book.valid?
      expect(book).to be_valid
    end

    it "should errors for valid attributes" do
      book = Book.new
      book.valid?
      full_messages = book.errors.full_messages
      expect(book).to_not be_valid
      expect(full_messages).to include("Title can't be blank")
      expect(full_messages).to include("Description can't be blank")
      expect(full_messages).to include("Published at can't be blank")
    end
  end

  describe "#creation" do
    it "should create a book record in mongodb" do
      mongo_books_count = Mongodb::Book.count
      book = Book.new(title: "Title1", description: "Description1", published_at: "2023-01-03")
      book.save

      mongo_book = Mongodb::Book.find_by(book_id: book.id)
      expect(mongo_book.title).to eq(book.title)
      expect(Mongodb::Book.count).to eq(mongo_books_count + 1)
    end
  end
end
