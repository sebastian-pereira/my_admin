module MyAdmin
	class UserRolesController < BaseController
	
		def index
			@objects = UserRole.new.index
			
			#erb = ERB.new(File.read(File.dirname(__FILE__) + "/../views/user_role/index.html.haml"))
	    	#erb.result(binding).html_safe
		end
	
	end
end