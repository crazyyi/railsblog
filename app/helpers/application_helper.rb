module ApplicationHelper
	def displayed_name(comment)
		comment.user ? comment.user.first_name + " " + comment.user.last_name :
		"#{comment.first_name} #{comment.last_name}"
	end

	def markdown(text)
		options = {
			filter_html:     true,
			hard_wrap:       true, 
			prettify:        true,
			link_attributes: { rel: 'nofollow', target: "_blank" },
			space_after_headers: true, 
			fenced_code_blocks: true
		}

		extensions = {
			autolink:           true,
			superscript:        true,
			disable_indented_code_blocks: true,
			tables:             true,
			strikethrough:     true
		}

		renderer = Redcarpet::Render::HTML.new(options)
		markdown = Redcarpet::Markdown.new(renderer, extensions)

		markdown.render(text).html_safe
	end
end
