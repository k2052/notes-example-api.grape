module Notes
	module Helpers
		module Auth
			def authenticated?
		    error!('Unauthorized', 401) unless current_account
			end

			def session
				env['rack.session']
			end

	    ##
	    # Returns the current_account, it's an instance of Account model.
	    #
	    def current_account
				@current_account ||= login_from_api_token
	      @current_account ||= login_from_session
	    end

		  ##
		  # Override the current_account, you must provide an instance of Account model.
		  #
		  # @example
		  #     set_current_account(Account.authenticate(params[:email], params[:password])
		  #
		  def set_current_account(account=nil)
		    session[Notes.config['session_id']] = account ? account.id : nil
		    @current_account = account
		  end

	    def login_from_session
	      Account.find_by_id(session[Notes.config['session_id']])
	    end

			def login_from_api_token
				return unless params[:api_token] or request.headers['X-Token']
				api_key = ApiKey.find_by_access_token(params[:api_token] || request.headers['X-Token'])
				return unless api_key
				Account.find api_key.account_id
			end
		end
	end
end
