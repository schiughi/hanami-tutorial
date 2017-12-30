require_relative '../../../spec_helper'

class NewBookParams < Hanami::Action::Params
  params do
    required(:book).schema do
      required(:title).filled(:str?)
      required(:isbn).filled(:str?)
      required(:author_id).filled
    end
  end
end

describe Web::Views::Books::New do
  let(:params)    { NewBookParams.new(book: {}) }
  let(:authors)   { Hash['Kent Beck': 1] }
  let(:exposures) { Hash[params: params , authors: authors] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/books/new.html.erb') }
  let(:view)      { Web::Views::Books::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays list of errors when params contains errors' do
    params.valid?

    rendered.must_include('There was a problem with your submission')
    rendered.must_include('Title is missing')
    rendered.must_include('Isbn is missing')
    # rendered.must_include('Author is missing')
  end
end
