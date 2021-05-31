require_relative  './template_page.rb'

class Cookie_Banner < PageTemplate

    def initialize(driver)
        super(driver)
    end

    # Elements:
    COOKIE_BANNER = { css: '.cookie-banner' }  
    BTN_ACCEPT_COOKIES = { css: '#banner-cookie-consent-allow-all' }
 
    # Methods:
    def close_cookie_banner
        click_on(BTN_ACCEPT_COOKIES)
        wait_for_element_to_not_exist(COOKIE_BANNER)
    end
    
end