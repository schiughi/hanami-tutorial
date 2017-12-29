require_relative '../../../spec_helper'

describe Web::Controllers::Books::Create do
  let(:action) { Web::Controllers::Books::Create.new }
  let(:params) { Hash[book: { title: 'Effective Ruby' , isbn: '978-4798139821' }] }

  before do
    BookRepository.new.clear
  end

  it 'creates a new book' do
    action.call(params)

    action.book.id.wont_be_nil
    action.book.title.must_equal params[:book][:title]
  end

  it 'redirects the user to the books listing' do
    response = action.call(params)
    response[0].must_equal 302
    response[1]['Location'].must_equal '/books'
  end
end
