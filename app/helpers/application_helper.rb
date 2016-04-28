module ApplicationHelper
	def displayed_name(comment)
    	comment.user ? comment.user.first_name + " " + comment.user.last_name :
    					 "#{comment.first_name} #{comment.last_name}"
  	end
end
