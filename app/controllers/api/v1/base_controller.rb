class Api::V1::BaseController < ActionController::Base
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/vnd.radd.v1' }
  #  before_filter :authorize
  #  load_and_authorize_resource
  respond_to :json
	def set_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Expose-Headers'] = 'Etag'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, PATCH, OPTIONS, HEAD'
    headers['Access-Control-Allow-Headers'] = '*, x-requested-with, Content-Type, If-Modified-Since, If-None-Match'
    headers['Access-Control-Max-Age'] = '86400'
  end

  private

  def render_unauthenticated 
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: {
      :success => false
    }, status: 401
  end
   def is_authenticated
    authenticate_token || render_unauthenticated
  end
 
  def authenticate_token
    authenticate_with_http_token do |token, options|
      @user = User.find_by_api_token  token
      if @user
        sign_in @user
      end
      @user
    end
  end
  
  def render_unauthorized
    render json: {
      :success => false,
      :error => "Un authorized, Please Log in to continue"
    }
  end

  def record_not_found(error)
    respond_to do |format|
      format.json { 
        render :json => {
          :error => error.message
        }, :status => 404 
      }
    end
  end
  
  def record_not_unique(error)
    respond_to do |format|
      format.json {
        render :json => {
          :error => error.message
        }, :status => 400
      }
    end
  end
  
  # Valid Record from model
  def record_not_valid(error)
    respond_to do |format|
      format.json {
        render :json => {
          :error => error.message
        }, :status => 400
      }
    end
  end
  # End of Validate  Error
  def generic_exception(error)
    respond_to do |format|
      format.json { render :json => {:error => error.message}, :status => 500 }
    end
  end
end
