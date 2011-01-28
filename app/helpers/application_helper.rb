module ApplicationHelper
	def title
		base_title = "Ruby on Rails Tutorial Sample App"
		if @title.nil?
			base_title
		elseA
			"#{base_title} | #{@title}"
		end
	end
end