require_relative  './template_page.rb'

class FooterMenu < PageTemplate
    
    def initialize(driver)
        super(driver)
    end

    # Elements:
    FOOTER = { css: 'footer' }
    IMG_APPLE_PAY = { css: '.pymt_apple_pay_image' }
    IMG_VISA = { css: '.pymt_card_image[src*=visa]' }
    IMG_MASTERCARD = { css: '.pymt_card_image[src*=mastercard]' }
    IMG_AMEX = { css: '.pymt_card_image[src*=amex]' }
    IMG_FINANCE = { css: 'img[src*="/payment/27"]' }
    IMG_PAYPAL = { css: '.pymt_card_image[src*=paypal]' }
    LINK_LOG_IN = { css: 'footer [href="/auth/login"]' }

    # Methods:
    def scroll_to_footer
        press_key(:end)
        wait_for_element_to_be_visible(FOOTER)
    end

    def apple_pay_is_displayed
        return displayed?(IMG_APPLE_PAY)
    end

    def visa_is_displayed
        return displayed?(IMG_VISA)
    end

    def mastercard_is_displayed
        return displayed?(IMG_MASTERCARD)
    end

    def amex_is_displayed
        return displayed?(IMG_AMEX)
    end

    def finance_is_displayed
        return displayed?(IMG_FINANCE)
    end

    def paypal_is_displayed
        return displayed?(IMG_PAYPAL)
    end

    def log_in_link_displayed
        return displayed?(LINK_LOG_IN)
    end

    def navigate_to_log_in_page
        click_on(LINK_LOG_IN)
    end
    
end