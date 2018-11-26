class BooksController < ApplicationController
  before_action :load_all, only: %i(index new)
  before_action :search, only: :index

  def index
    @books = @books.page(params[:page]).per(Settings.paginations.per_page)
  end

  def show
    @book = Book.find params[:id]
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params

    if @book.save
      flash[:success] = t ".success"
      redirect_to books_path
    else
      flash[:danger] = t ".danger"
      redirect_to new_book_path
    end
  end

  private
  def book_params
    if params[:book][:author_attributes][:name].present?
      params.require(:book).permit :name, :description, :number_of_pages,
        :quantity, :price, :category_id, :publisher_id, :category_id,
        author_attributes: [:name]
    else
      params.require(:book).permit :name, :description, :number_of_pages, :author_id,
        :quantity, :price, :category_id, :publisher_id, :category_id
    end
  end

  def load_all
    @categories = Category.all
    @authors = Author.all
    @publishers = User::Publisher.all
  end

  def search
    category = params[:category]
    author = params[:author]
    publisher = params[:publisher]
    book_name = params[:book_name]
    @books = Book.search_cate(category)
                 .search_author(author).search_publisher(publisher).search_name(book_name)
                 .includes(:author, :publisher, :category)
  end
end
