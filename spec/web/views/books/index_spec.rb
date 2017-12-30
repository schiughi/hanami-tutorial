require_relative '../../../spec_helper'

describe Web::Views::Books::Index do
  let(:exposures) { Hash[books: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/books/index.html.erb') }
  let(:view)      { Web::Views::Books::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #books' do
    view.books.must_equal exposures.fetch(:books)
  end

  describe 'when there are no books' do
    it 'show a placeholder message' do
      rendered.must_include('There are no books yet')
    end
  end

  describe 'when there are books' do
    let(:book1)  { Book.new(title: 'Test Driven Development' , isbn: '978-0321146533', author: { name: 'Kent Beck' }) }
    let(:book2)  { Book.new(title: 'Domain-Driven Design', isbn: '978-0321125217', author: { name: 'Eric Evans' }) }
    let(:exposures) { Hash[books: [book1, book2]] }

    it 'lists them all' do
      rendered.scan(/class="book"/).count.must_equal 2
      rendered.must_include('Test Driven Development')
      rendered.must_include('Kent Beck')
      rendered.must_include('Domain-Driven Design')
      rendered.must_include('Eric Evans')
    end

    it 'hides the placeholder message' do
      rendered.wont_include('There are no books yet.')
    end
  end
end
