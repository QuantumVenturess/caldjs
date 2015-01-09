class PagesController < ApplicationController

  def home
    @title = 'Cal Djs'
  end

  def about
    @title = 'About'
    @photos = Photo.order('created_at DESC').paginate(page: 
      params[:page], per_page: 6)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def contact
    @title = 'Contact'
    @comment = Comment.new
  end
end