require 'spec_helper'

describe 'AddBook' do
  let(:interactor) { AddBookService.new }
  let(:attributes) { Hash[title: 'New Book' , isbn: '978-111' , author_id: @author.id ] }
  before do
    @author = AuthorRepository.new.create(name: 'Kent Beck')
  end

  describe 'good input' do
    let(:result) { interactor.call(attributes) }
    it 'creates a book with correct title, isbn and author' do
      assert_equal(result.book.title, "New Book")
      assert_equal(result.book.isbn , "978-111")
    end
  end
end
