require 'spec_helper'

describe 'AddBook' do
  let(:interactor) { AddBook.new }

  it 'succeeds' do
    expect(interactor.call).to be_a_success
  end
end
