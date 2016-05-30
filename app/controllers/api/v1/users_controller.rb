class Api::V1::UsersController < Api::V1::BaseController
	before_filter :is_authenticated, :only => [:destroy]
	def index
		@users = User.all.order(:id => :desc)
		render :json => {
			:users => @users,
			:success => true
		}
	end
	def create
		@user = User.create(user_params)
		if @user
	        @user.api_token = SecureRandom.uuid
	        @user.save!
	        sign_in('user', @user)
	    else
	    	render :json =>{
	    		:error => "Something went wrong. Error!.",
				:success => false
			}, :status => 400
      	end	
	end

	def destroy
		@user = User.find_by_id(params[:id])
		if @user
			@user.destroy
			render :json =>{
			:success => true
			}, :status => 200
		else
			render :json =>{
			:success => false
			}, :status => 400
		end
	end

	def email_exists
		@user = User.find_by_email(params[:email])
	    @exists = (@user != nil)
	    render :json => {
	    	:exists => @exists
	    }
	end


	# def reset_password_email(email)
	# 	@user = User.find_by_email(email).api_token
	# 	if @user
	# 		if UserMailer.send_reset_passowrd_email(@user).deliver
	# 			render :json => {
	# 	    		:user=>@user,
	# 	    		:success => true
	# 	    	}, :status => 200
	# 	    else
	# 	    	render :json => {
	#     			:success =>false
	#     		},:status => 400
	# 	    end
	#     else
	#     	render :json => {
	#     	:success =>false
	#     	},:status => 400
	#     end
	# end


	# POST /users/forgot_password
  # Sends reset password instructions to provided email address.
  	def forgot_password
	    if params[:email]
	      @user = User.find_by_email(params[:email].downcase)
	      if @user
	        @user.send_reset_password_instructions
	        render :json =>{
				:success => true
			}, :status => 200
	      else
		      render :json => {
		        :error => "Invalid Email. Can not find user with this email."
		      }, :status => 400  
	      end
	    else
	      render :json => {
	        :error => "Invalid Email/Password."
	      }, :status => 400
	    end
	end



	# POST /users/reset_password
  # Updates user password.
	def reset_password
	    @user = User.find_by_email(params[:user_email])
	    if @user
	      @user.update_attributes(:password => params[:password], :password_confirmation => params[:password])
	      	render :json =>{
				:success => true
			}, :status => 200
	  	else
	  		render :json => {
		        :error => "Invalid Email. Can not find user with this email."
		    }, :status => 400  
	   	end
	end

	def check_user
		@user = User.find_by_reset_password_token(params[:token])
		if @user
			render :json => {
				:user => @user,
				:success => true
			}
		else
			render :json => {
		        :error => "Invalid Email. Can not find user with this token."
		    },:status => 400
		end
	end



	private
	def user_params
		params.require(:user).permit( 
			:first_name, 
			:last_name , 
			:phone_number,
			:email, 
			:password,
			:password_confirmation,
			:profession,
			:age)
    end

end
