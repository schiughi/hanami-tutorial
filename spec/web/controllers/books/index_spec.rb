require_relative '../../../spec_helper'

describe Web::Controllers::Books::Index do
  let(:action) { Web::Controllers::Books::Index.new }
  let(:params) { Hash[] }
  let(:repository) { AuthorRepository.new }

  before do
    repository.clear
    author = repository.create_with_books(name: 'Kent Beck', books: [{title: 'Test Driven Development' , isbn: '978-0321146533'}])
    @book = author.books.first
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes all books' do
    action.call(params)
    action.exposures[:books].must_equal [@book]
  end
end
