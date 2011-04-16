module AwsSdbHelper

	def init_sdb(aws_access_key, aws_secret_key)
		@sdb = RightAws::SdbInterface.new(aws_access_key, aws_secret_key,
										  {
												  :api_version => '2009-04-15'
										  })
	end


	def init_sdb_from_session(session)
		init_sdb(session[:aws_access_key], session[:aws_secret_key])
	end
end