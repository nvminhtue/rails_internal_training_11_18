class BooksController < ApplicationController
  before_action :load_all, only: %i(index edit)
  before_action :search, only: :index
  before_action :load_book, only: %i(destroy edit update)

  def index
    @books = @books.page(params[:page]).per(Settings.paginations.per_page)
  end

  def show
    @book = Book.find params[:id]
  end

  def edit; end

  def update
    if @book.update_attributes book_params
      flash[:success] = t ".update_success"
      redirect_to books_path
    else
      flash[:warning] = t ".update_warning"
      render :edit
    end
  end

  def new
    @book = Book.new
    @categories = Category.all
    @authors = Author.all
    @publishers = User::Publisher.all
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

  def destroy
    if @book.destroy
      respond_to do |format|
        format.js{render layout: false}
        format.html{redirect_to books_url}
        format.json{head :no_content}
      end
    else
      flash[:warning] = t ".delete_warning"
      redirect_to books_path
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

  def load_book
    @book = Book.find_by(id: params[:id])
  end
end
