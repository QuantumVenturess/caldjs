class PostsController < ApplicationController
  before_filter :authenticate, except: [:blog, :show]

  def blog
    @title = 'Blog'
    @posts = Post.where('published = ?', true).paginate(page: params[:page], 
      per_page: 5)
  end

  def show
    @post = Post.find(params[:id])
    @title = @post.name
    if @post.content[/(<img("[^"]*"|[^>])+)(?<!\/)>/i]
      if @post.content[/(<img("[^"]*"|[^>])+)(?<!\/)>/i].split('"')[3]
        @image = @post.content[/(<img("[^"]*"|[^>])+)(?<!\/)>/i].split('"')[3]
      else
        @image = @post.content[/(<img("[^"]*"|[^>])+)(?<!\/)>/i].split('"')[1]
      end
    else
      @image = 'http://s3.amazonaws.com/caldjs/logo.png'
    end
    @post.increment!(:views, by = 1)
    @posts = Post.where("published = ?", true)
    if @post.published?
      @next_post = @posts[@posts.index(@post) - 1]
      @prev_post = @posts[@posts.index(@post) + 1]
    end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
  end

  def index
    @title = 'Posts'
    @posts = Post.where('published = ?', false).order(
      'created_at ASC').paginate(page: params[:page], per_page: 5)
    render 'blog'
  end

  def new
    @title = 'New Post'
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to @post
    else
      @title = 'New Post'
      render 'new'
    end
  end

  def edit
    @title = 'Edit Post'
    @post = Post.find(params[:id])
    render 'new'
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to @post
    else
      @title = 'Edit Post'
      render 'new'
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to posts_path
    else
      flash[:error] = 'Delete failed'
      redirect_to post
    end
  end

  def publish
    post = Post.find(params[:id])
    if post.published?
      post.update_attributes(published: false, published_date: nil)
      flash[:success] = 'Post unpublished'
    else
      post.update_attributes(published: true, published_date: Time.now)
      flash[:success] = 'Post published'
    end
    redirect_to post
  end
end