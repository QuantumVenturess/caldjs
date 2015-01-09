module ApplicationHelper

	def title
		base_title = 'Cal Djs'
		if @title.nil?
			base_title
		else
			"#{@title}"
		end
	end

	def to_html(str)
		simple_format h(str)
	end

	def root_url
		if request.fullpath == '/'
			request.url
		else
			request.url.split(request.fullpath)[0]
		end
	end
end