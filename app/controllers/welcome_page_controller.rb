require "sdb/right_sdb_interface"


class WelcomePageController < ApplicationController

	include AwsSdbHelper


	def index
		if session.has_key?(:aws_access_key) and session.has_key?(:aws_secret_key)
#			redirect_to about_path

		end
	end



	def about
		@title = 'About'
	end




	def login_post
		aws_access_key = params[:login_form][:aws_access_key]
		aws_secret_key = params[:login_form][:aws_secret_key]

		begin

			init_sdb(aws_access_key, aws_secret_key)

			session[:aws_access_key] = aws_access_key
			session[:aws_secret_key] = aws_secret_key

			sdb_domains = @sdb.list_domains

			redirect_to sdb_domains_path

		rescue Exception => e

			flash.now[:error] = "Invalid AWS credentials: " + e.to_s


			session.clear

			render 'index'

		end
	end




	def logout
		session.clear
		redirect_to :root
	end


end
