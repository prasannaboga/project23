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
end
