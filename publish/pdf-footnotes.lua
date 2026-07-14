function Note(elem)
	if FORMAT:match 'pdf' or FORMAT:match 'html' then
		-- Change footnotes to WeasyPrint-friendly syntax.
		span_content = pandoc.utils.blocks_to_inlines(elem.content)
		return pandoc.Span(span_content, {class = 'footnote'})
	end
end
