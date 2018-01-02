require 'hanami/interactor'

class AddBook
  include Hanami::Interactor

  expose :book

  def initialize(author , repository: AuthorRepository.new)
    @author = author
    @repository = repository
  end

  def call(book_attributes)
    @book = Book.new(book_attributes)
    @repository.add_book(@author, @book)
  end
end
