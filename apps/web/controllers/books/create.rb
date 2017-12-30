module Web::Controllers::Books
  class Create
    include Web::Action

    expose :book

    params do
      required(:book).schema do
        required(:title).filled(:str?)
        required(:isbn).filled(:str?)
        required(:author).filled(:int?)
      end
    end

    def call(params)
      if params.valid?
        repository = AuthorRepository.new
        @author = repository.find(params[:book][:author])
        @book = repository.add_book(@author, Book.new(params[:book]))
        redirect_to '/books'
      else
        self.status = 422
      end
    end
  end
end
