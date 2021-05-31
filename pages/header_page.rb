require_relative  './template_page.rb'

class HeaderMenu < PageTemplate
    
    def initialize(driver)
        super(driver)
    end

    # Elements:
    LINK_BASKET_ICON = { css: 'header .icon-basket a' }
    INPUT_SEARCH_FIELD = { css: '#srch-str' }
    BTN_SUBMIT_SEARCH = { css: '#header-search-button' }
    NAV_MENU = { css: '#nav' }
    LINKS_NAV_MENU = { css: '.prd-bl' }   

    # Methods:
    def navigate_to_basket_page
        click_on(LINK_BASKET_ICON)
    end
    
    def search_for(search_term)
        type(INPUT_SEARCH_FIELD, search_term)
        click_on(BTN_SUBMIT_SEARCH)
    end
    
    def is_nav_menu_displayed
        return displayed?(NAV_MENU)
    end

    def click_parent_nav_menu_link(href_value)
        parent_links = find_all(LINKS_NAV_MENU)
        desired_link = parent_links.find { |link| link.attribute('href').include?(href_value) }
        desired_link.click
    end
        
end
