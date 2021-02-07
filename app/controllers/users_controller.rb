class UsersController < ApplicationController

	#lists the users
	def index
		# user = User.find_by(user_name: params["user_name"])
		# if user.present?
		@sort_item = params["sortItem"]
		user = User.includes(:products, :categories)
		case @sort_item
		when "category"
			@users =  user.order('categories.name')
		when "username"
			@users =  user.order(username: :asc)
		when "project"
			@users = user.order('products.title')
		else
			@users = user.order(id: :desc)
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

	#creates users
	def create
		user = User.new(user_strong_params)
		if user.save
			redirect_to root_url
			flash[:success] = "User created successfully"
		else
			# redirect_back fallback_location: "", :flash => { :error => "#{user.errors.messages.values.join(",")}" }
			flash["error"] = "#{user.errors.messages.values.join(",")}" 
      		redirect_back fallback_location: ""
		end
	end

private
	def user_strong_params
			params.require(:user).permit(
			:user_name,
			:email,
			:encrypted_password,
			category: [:name, products: [:title]])
	end
end
