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
			@users =  user.order(user_name: :asc)
		when "project"
			@users = user.order('products.title')
		else
			@users = user.order(updated_at: :desc)
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
			insert_category(params["user"]["categories_attributes"].to_unsafe_h.values, user)
			redirect_to root_url
			flash["success"] = "User created successfully"
		else
      redirect_back fallback_location: ""
			flash["error"] = "#{user.errors.messages.values.join(",")}" 
		end
	end

private
	def user_strong_params
			params.require(:user).permit(
			:user_name,
			:email,
			:encrypted_password,
			products_attributes:
			[
				:title
			])
	end

	def insert_category(category_data, user)
		categories = Category.create(category_data)
		result = categories.map{|kategory| {category_id: kategory.id}}
		result.each do |category|
			user.products.map{|a| a.update(category)}
		end
	end
end



