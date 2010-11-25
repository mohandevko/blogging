class CommentsController < ApplicationController
  
  def index
    @comments = Comment.all
    
  end
  
  def new
    @comment = Comment.new
    @bs = Blogpost.all
    @user = User.all
  end
  
  def create
    @comment = Comment.new(params[:comment])
    @comment.blogpost_id = params[:blogpost_id]
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice]="comment created successfully"
      redirect_to :controller => "blogpost", :action => "show", :id => @comment.blogpost_id
    else
      @bs = Blogpost.all
      @user = User.all
      render :action => "new"
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
    @bs = Blogpost.all
    @user = User.all
  end
  
  def update
    @comment = Comment.find(params[:id])
    @bs = Blogpost.all
    @users = User.all
    if @comment.update_attributes(params[:comment])
      flash[:notice]="comment updated successfully"
      redirect_to :controller => "comments", :action => "index"
    else
      @bs = Blogpost.all
      @user = User.all
      render :action => "edit"
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :controller => "blogpost", :action => "show", :action => "show", :id => @comment.blogpost_id
  end
  
  def show
    @comment = Comment.find(params[:id])
    @bs = Blogpost.all
    @user = User.all
  end
  
  
end   
