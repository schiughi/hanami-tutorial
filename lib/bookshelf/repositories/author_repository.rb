class AuthorRepository < Hanami::Repository
  associations do
    has_many :books
  end

  def create_with_books(books)
    assoc(:books).create(books)
  end

  def find_with_books(id)
    aggregate(:books).where(id: id).as(Author).one
  end

  def add_book(author, book)
    assoc(:books, author).add(book)
  end
end
