class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
        
    if @book.save
      flash[:notice] = "Book created!!"
      redirect_to "/books"
    else
      # render "books/new"
      render :new # 發生錯誤時可以借new.html保留原本的填寫資料
    end
  end
  
  def edit
    @book = Book.find_by(id: params[:id])
  end

  def update
    @book = Book.find_by(id: params[:id])
      if @book.update(book_params)
        flash[:notice] = "Book edited!!"
        redirect_to "/books"
      else
        render :edit
      end
  end

  private
  def book_params
    params.require(:book).permit(:title, :content)
  end


end
