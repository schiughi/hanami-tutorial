module Web::Controllers::Books
  class New
    include Web::Action

    expose :authors

    def call(params)
      @authors = AuthorRepository.new.all.inject({}) do |hash, author|
        hash[author.name] = author.id
        hash
      end
    end
  end
end
