require 'features_helper'

describe 'Add a book' do
  after do
    BookRepository.new.clear
  end

  it 'can create a new book' do
    visit '/books/new'

    within 'form#book-form' do
      fill_in 'Title' , with: 'New book'
      fill_in 'Isbn'  , with: '978-1111-111'

      click_button 'Create'
    end

    current_path.must_equal('/books')
    assert page.has_content?('New book')
  end
end
