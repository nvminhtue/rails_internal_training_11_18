class AuthorsController < ApplicationController
  def create
    @author = Author.new author_params
  end

  private
  def author_params
    params.require(:author).permit :name
  end
end
