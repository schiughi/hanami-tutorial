module Web::Controllers::Books
  class Create
    include Web::Action

    expose :book

    params do
      required(:book).schema do
        required(:title).filled(:str?)
        required(:isbn).filled(:str?)
        required(:author_id).filled(:int?)
      end
    end

    def call(params)
      if params.valid?
        @book = BookRepository.new.create(params[:book])
        redirect_to '/books'
      else
        self.status = 422
      end
    end
  end
end
