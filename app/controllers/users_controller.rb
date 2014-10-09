class UsersController < ApplicationController
  before_filter :authenticate_user!

	def index
		@users = User.all
    @admin = User.first
  unless @admin == current_user
    redirect_to :back, :alert => "Access denied."
  end
		
	end

	def show
		@user = User.find(params[:id])
		
	end

	def create
    @user = User.new(params[:user])
 
    respond_to do |format|
      if @user.save
 
        render'show', notice: 'User was successfully created.'
        
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end



end
