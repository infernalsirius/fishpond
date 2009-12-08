# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  include Oink::MemoryUsageLogger
  include Memorylogic

  helper_method :current_user_session, 
                :current_user, 
                :logged_in?,            # Lockdown helper
                :current_user_is_admin? # Lockdown helper
                
  filter_parameter_logging :password, :password_confirmation

  protect_from_forgery
  
    private
      def current_user_session
        return @current_user_session if defined?(@current_user_session)
        @current_user_session = UserSession.find
      end

      def current_user
        return @current_user if defined?(@current_user)
        @current_user = current_user_session && current_user_session.record
      end

      def require_user
        unless current_user
          store_location
          flash[:notice] = "Vous devez être connecté pour accéder à cette page."
          redirect_to new_user_session_path
          return false
        end
      end

      def store_location
        session[:return_to] = request.request_uri
      end

      def redirect_back_or_default(default)
        redirect_to(session[:return_to] || default)
        session[:return_to] = nil
      end
      
    protected

      def clear_authlogic_session
        sess = current_user_session
        sess.destroy if sess
      end
end
