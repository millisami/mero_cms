module MeroCms # :nodoc:
  module Helpers
    def mero_cms_chunk(*args)
      page = args.shift
      @page_chunk = MeroCms::Page.find_by_title(page)
      content_tag(@page_chunk) do
        content_tag(:h3, @page_chunk.title) + simple_format(@page_chunk.content)
      end.html_safe
    end
  end
end

::ActionView::Base.send(:include, MeroCms::Helpers) # :nodoc: