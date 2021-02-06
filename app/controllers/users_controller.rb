class UsersController < ApplicationController
	def index
		# user = User.find_by(user_name: params["user_name"])
		# if user.present?
		@sort_item = params["sortItem"]
		case @sort_item
		when "category"
			@users =  User.order('categories.name')
		when "username"
			@users =  User.order(username: :asc)
		when "project"
			@users = User.order('product.title')
		else
			@users = User.order(id: :desc)
		end
		# @users = users #.paginate(page: params["page"], per_page: 2)
		# else
		# 	flash["error"] = "Username doesn't exist"
		# 	redirect_back fallback_location: ""
		# end
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
		params.require(:user).permit(
		:user_name,
		:email,
		:encrypted_password,
		category_attributes: [:name, products_attributes: [:title]])
		end
end
