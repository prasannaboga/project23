class CommentsController < ApplicationController
  def index
    a = 1
    b = 2
    c = a + b
    render json: { c: c }
  end
end
