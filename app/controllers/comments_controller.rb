class CommentsController < ApplicationController

	def new
		@comment = build_comment(comment_params)
	end

	def create
		@comment = build_comment(comment_params)
		respond_to do |format|
			if @comment.save
				make_child_comment
				format.html
				format.json { redirect_to(:back, :notice => 'Comment was successfully added.')}
			else
				p @comment.errors
				format.html
				format.json { redirect_to :back }
			end
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:user, :first_name, :last_name, :body, :commentable_id, :commentable_type, :comment_id)
		end

		def commentable_type
			comment_params[:commentable_type]
		end

		def commentable_id
			comment_params[:commentable_id]
		end

		def comment_id
			comment_params[:comment_id]
		end

		def body
			comment_params[:body]
		end

		def make_child_comment
			return "" if comment_id.blank?

			parent_comment = Comment.find comment_id
			@comment.move_to_child_of(parent_comment)
		end

		def build_comment(comment_params)
			if current_user.nil?
      			user_id = nil 
      			first_name =  comment_params[:first_name]
      			last_name = comment_params[:last_name]
    		else
      			user_id = current_user.id
      			first_name = current_user.first_name
      			last_name = current_user.last_name
    		end
    		commentable = commentable_type.constantize.find(commentable_id)
			Comment.build_from(commentable, user_id, comment_params[:body],
						first_name, last_name)
		end
end
