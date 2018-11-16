class BooksController < ApplicationController
  before_action :load_all, only: :index
  def index
    category = params[:category]
    author = params[:author]
    publisher = params[:publisher]
    book_name = params[:book_name]
    @books = @books.where("category_id = ?", category) if category.present?
    @books = @books.where("author_id = ?", author) if author.present?
    @books = @books.where("publisher_id = ?", publisher) if publisher.present?
    @books = @books.where("name like ?", "%#{book_name}%")
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @categories = Category.all
    @authors = Author.all
  end

  def create
    @book = Book.new book_params
    @book.publisher_id = 1
    authorname = params[:book][:author_attributes][:name]
    authorid = params[:book][:author_id]
    if authorid.present?
      @book.author_id = authorid
    elsif Author.where(name: authorname).exists?
      @book.author_id = Author.find_by!(name: authorname).id
    else
      @book.author_name
    end
    @book.save
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit :name, :description, :number_of_pages,
      :quantity, :price, :category_id, :publisher_id, :category_id,
      author_attributes: [:name]
  end

  def load_all
    @books = Book.all
    @categories = Category.all
    @authors = Author.all
    @publishers = User.publisher_all.all
  end
end
