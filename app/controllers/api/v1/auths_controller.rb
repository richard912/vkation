class Api::V1::AuthsController < Api::V1::BaseController

    def authenticate
        @oauth = "Oauth::Facebook".constantize.new(params)
            if @oauth.authorized?
              @fb_user = @oauth.formatted_user_data
              @user = User.find_by_email(@fb_user[:email])
              unless @user
                @user = User.create(
                    :email => @fb_user[:email],
                    :first_name => @fb_user[:first_name],
                    :last_name => @fb_user[:last_name],
                    :gender => @fb_user[:gender] == "male" ? true : false,
                    :password => @fb_user[:uid],
                    :password_confirmation => @fb_user[:uid],
                    :api_token => SecureRandom.uuid
                )
              else
                @user.api_token = SecureRandom.uuid
                @user.save!
              end
            else
              render :json => {
              			:success => false
              			}, :status => 400
            end
    end
    def payment_test
      begin
        @order = Razorpay::Payment.fetch(params[:payment_id])
        render :json => {
          :order => @order
        }
      rescue Exception
        render :json => {
          :error_message => 'Please retry or contact your dealer'
        }
      end
    end

end
