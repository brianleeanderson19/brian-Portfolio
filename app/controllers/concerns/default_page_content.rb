module DefaultPageContent
    extend ActiveSupport::Concern
    included do 
        before_filter :set_page_defaults
    end

    def set_page_defaults
        @page_title = "Anderson Portfolio | My Portfolio Website"
        @seo_keywords = "Brian Andersons portfolio"
    end
end