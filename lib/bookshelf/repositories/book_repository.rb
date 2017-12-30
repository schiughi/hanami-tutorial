class BookRepository < Hanami::Repository
  associations do
    belongs_to :author
  end

  def find_with_author(id)
    aggregate(:author).where(id: id).map_to(Book).one
  end

  def with_author
    aggregate(:author).map_to(Book).to_a
  end
end
