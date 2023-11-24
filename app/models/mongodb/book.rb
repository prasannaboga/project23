module Mongodb
  class Book
    include Mongoid::Attributes::Dynamic
    include Mongoid::Document
    include Mongoid::Timestamps

    store_in collection: "books"

    field :book_id, type: Integer
    field :title, type: String
    field :description, type: String
    field :published_at, type: DateTime
  end
end
