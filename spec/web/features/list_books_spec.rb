require 'features_helper'

describe 'List books' do
  let(:repository) { AuthorRepository.new }
  before do
    repository.clear
    BookRepository.new.clear
    repository.create_with_books(name: 'Kent Beck', books: [{title: 'Test Driven Development' , isbn: '978-0321146533'}])
    repository.create_with_books(name: 'Eric Evans', books: [{title: 'Domain-Driven Design', isbn: '978-0321125217'}])
  end
  it 'displays each book on the page' do
    visit '/books'

    within '#books' do
      assert page.has_css?('.book', count: 2), 'Expected to find 2 books'
    end
  end
end
