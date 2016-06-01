class Api::V1::SessionsController < Api::V1::BaseController
	def create
    @user = User.is_valid_user(params[:email],params[:password])
	    if @user
	    	sign_in("user", @user)
	     #    @user.api_token = SecureRandom.uuid
	     #    @user.save!
	        render :json => {
	        	:success => true,
	        	:user => @user

	        	}, :status => 200
	    else
	    	render :json => {
	    		:error => "Invalid Email/Password.",
	    		:success => false
	    	}, :status => 400
	    end
    end
	  # POST /users/logout
	def destroy
	    if current_user.present?
	    	
	  	# current_user.api_token = nil
	  	# current_user.save!
	    sign_out
	    render :json => {
	    	:success => true,
	    	:info => "Logged out", 
	    	:csrfParam => request_forgery_protection_token, 
	    	:csrfToken => form_authenticity_token
	    	}, :status => 200
	    else
	      render :json => {
	      :success => false,
	      :error => "Your session expired. Please sign in again to continue.",
	      }, :status => 401
	    end
	end
	def facebook_login

	end
end
