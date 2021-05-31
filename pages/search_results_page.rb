require_relative  './template_page.rb'

class SearchResultsPage < PageTemplate

    def initialize(driver)
        super(driver)
    end

    # Elements:
    SECTION_RESULTS = { css: '.results-block' }
    LIST_RESULTS = { css: '.result-list li' }

    # Methods:
    def get_number_of_results
        return length_of(LIST_RESULTS)
    end
    
end
