class CommentsController < ApplicationController
  before_filter :authenticate, except: :create

  def index
    @title = 'Comments'
    @read = Comment.where('read = ?', true).order('created_at DESC')
    @unread = Comment.where('read = ?', false).order('created_at ASC')
  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      respond_to do |format|
        format.html {
          flash[:success] = "Thank you for contacting us. We will respond to
          your inquiry as soon as possible."
          redirect_to contact_path
        }
        format.js
      end
    else
      @title = 'Contact'
      render 'pages/contact'
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:notice] = 'Comment deleted'
    redirect_to comments_path
  end

  def read
    comment = Comment.find(params[:id])
    comment.read = true
    comment.save
    flash[:success] = 'Comment read'
    redirect_to comments_path
  end

  def unread
    comment = Comment.find(params[:id])
    comment.read = false
    comment.save
    flash[:success] = 'Comment unread'
    redirect_to comments_path
  end
end