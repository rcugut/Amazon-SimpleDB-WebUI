class SdbDomainsController < ApplicationController

	include AwsSdbHelper

	def show

		init_sdb_from_session(session)

		@sdb_domains = @sdb.list_domains


	end


end
