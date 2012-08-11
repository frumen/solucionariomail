module ApplicationHelper

	# Retornar el titulo
	def full_title(page_title)
		base_title= "Solucionario"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

end
