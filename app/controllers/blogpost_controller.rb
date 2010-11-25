class BlogpostController < ApplicationController
  
  def index
    @bs = Blogpost.all
    @comments = Comment.all
    
  end
  
  def readindex
    @bs = Blogpost.all
    @comments = Comment.all
  end
  
  def new
    @b = Blogpost.new
    @user = User.all
  end
  
  def create
    @b = Blogpost.new(params[:b])
    @b.user_id = current_user.id
    puts "=================================="
    puts @b.user_id
    puts "==================================", :id => @comment.blogpost_id
    if @b.save
      flash[:notice] = "Blogpost created successfully"
      redirect_to :controller => "blogpost", :action => "index"
    else
      render :action => "new"
    end
  end
  
  def edit
    @b = Blogpost.find(params[:id])
    @comments = Comment.find_all_by_blogpost_id(@b.id)
  end
  
  def update
    @b = Blogpost.find(params[:id])
    if @b.update_attributes(params[:b])
     flash[:notice]="blogpost updated successfully"
     redirect_to :controller => "blogpost", :action => "index"
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @b = Blogpost.find(params[:id])
    @comments = Comment.find_all_by_blogpost_id(@b.id)
    @b.destroy
    redirect_to :action => "index"
  end
  
  def show
    @b = Blogpost.find(params[:id])
    @comments = Comment.find_all_by_blogpost_id(@b.id)
   end 
   
  
   
   def mohanindex
    @commentss = Comment.all
    
  end
  
  def commentnew
    @comment = Comment.new
    @bs = Blogpost.all
    @user = User.all
  end
  
  def commentcreate
    @comment = Comment.new(params[:comment])
    @comment.blogpost_id = params[:blogpost_id]
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice]="comment created successfully"
      redirect_to :controller => "blogpost", :action => "commentshow", :id => @comment.blogpost_id
    else
      @bs = Blogpost.all
      @user = User.all
      render :action => "commentnew"
    end
  end
  
  def commentedit
    @comment = Comment.find(params[:id])
    @bs = Blogpost.all
    @user = User.all
  end
  
  def commentupdate
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
  
  def commentdestroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :controller => "blogpost", :action => "show", :action => "show", :id => @comment.blogpost_id
  end
  
  def commentshow
    @b = Blogpost.find(params[:id])
    @comments = Comment.find_all_by_blogpost_id(@b.id)
  end 
  
  def blogandcommentshow
    #@b = Blogpost.find(params[:id])
    #@comments = Comment.find_all_by_blogpost_id(@b.id)
    @b = Blogpost.find(params[:blogpost_id])
        @comment = Comment.find(params[:comment_id])
  end
  
  def ratings
    u = User.find_by_name 'u'
    b = Blogpost.find_by_title 'b'
  end  
end
