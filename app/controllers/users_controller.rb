class UsersController < ApplicationController
  def index
  	user = User.find_by(user_name: params["user_name"])
  	if user.present?
  		user.products
  	else
  		flash["error"] = "Username doesn't exist"
  		redirect_back fallback_location: ""
  	end
  end

  def sign_up
  	@user = User.new
  end

  def login
  end

  def create
  	user = User.new(user_strong_params)
	  	if user.save!
	  		flash[:success] = "User created successfully"
	  		redirect_to root_path
	  	else
	  		flash[:error] = "#{user.errors.messages.values.join(",")}"
	  		redirect_back fallback_location: ""
	  	end
  end

  private
  	def user_strong_params
  		params.require(:user).permit(:user_name, :email, :encrypted_password)
  	end
end
