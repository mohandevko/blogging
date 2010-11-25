class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  
  def list
  end
  
  def view_profile
    @user = current_user
  end
  
  def edit_profile
    @user = User.find(params[:id])
  end
  
  def upload
    @user = User.find(params[:id])
    if params[:user].present? and params[:user][:avatar].present?
      @user.attributes = @user.attributes.merge(params[:user])
      if @user.save(false)
        params[:success] = "Successfully changed avatar"
      end
      redirect_to :controller => "users", :action => "edit_profile", :id => current_user.id
    else
      flash[:error] = "Please select a file to upload"
      redirect_to user_path(@user, :change_avatar => true)
    end
  end
  
  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
  
  
  
end
