class UsersController < ApplicationController
   def new
   end

   def create
    # @user = User.new(user_params)
    @user = User.new(username: params[:username], email: params[:email], password: params[:password]) #all of this should be in a single hash
 #form_for does it, pointing to a user field with a hash of values. #manually, simply change the name attribute in the form within view (new.html.erb)
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:username,:email,:password,:authenticity_token)
    end
end