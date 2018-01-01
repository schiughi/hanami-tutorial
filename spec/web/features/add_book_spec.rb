require 'features_helper'

describe 'Add a book' do
  before :all do
    AuthorRepository.new.clear
    AuthorRepository.new.create(name: 'Kent Beck')
    AuthorRepository.new.create(name: 'Eric Evans')
  end

  after :all do
    BookRepository.new.clear
    # AuthorRepository.new.clear
  end

  it 'can create a new book' do
    visit '/books/new'

    within 'form#book-form' do
      fill_in 'Title'    , with: 'New book'
      fill_in 'Isbn'     , with: '978-1111-111'
      select 'Kent Beck' , from: 'Author id'
      click_button 'Create'
    end

    current_path.must_equal('/books')
    assert page.has_content?('New book')
  end

  it 'displays list of errors when params contains errors' do
    skip 'can not load "authors"'
    visit '/books/new'

    within 'form#book-form' do
      click_button 'Create'
    end

    current_path.must_equal '/books'

    assert page.has_content? 'There was a problem with your submission'
    assert page.has_content? 'Title must be filled'
    assert page.has_content? 'Isbn must be filled'
  end
end
