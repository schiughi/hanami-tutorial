require 'features_helper'

describe 'Visit home' do
  it 'is succuess' do
    visit '/'

    page.body.must_include('Bookshelf')
  end
end
