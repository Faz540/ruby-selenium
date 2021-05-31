require_relative  './template_page.rb'

class PDP < PageTemplate

    def initialize(driver)
        super(driver)
    end

    # Elements:
    CONTAINER_PDP = { css: '.pdp-page' }
    TXT_PRODUCT_TITLE = { css: '.pdp-title h1' }
    TXT_PRODUCT_PRICE = { css: '.info-row-price .c-val' }
    TXT_PRODUCT_CURRENCY_SYM = { css: '.info-row-price .c-sym' }
    BTN_TOP_ADD_TO_BASKET = { css: 'a.add-to-basket-button' }
    BTN_BOTTOM_ADD_TO_BASKET = { css: 'button.add-to-basket-button' }
    CHECK_WARRANTY = { css: '.extended-warranty-link' }
    LIST_SIMILAR_PRODUCTS = { css: '.similar-products .accessories-list li' }
    CHECK_RELATED_PRODUCTS = { css: ".related-products [type='checkbox']" }

    # Methods:
    def click_top_add_to_basket
        click_on(BTN_TOP_ADD_TO_BASKET)
    end

    def click_bottom_add_to_basket
        click_on(BTN_BOTTOM_ADD_TO_BASKET)
    end

    def select_warranty
        click_on(CHECK_WARRANTY)
    end

    def number_of_similar_products
        return length_of(LIST_SIMILAR_PRODUCTS)
    end

    def number_of_related_products
        return length_of(CHECK_RELATED_PRODUCTS)
    end

    def select_related_product
        @driver.find_elements(CHECK_RELATED_PRODUCTS)[0].click
    end

    def add_to_bag_top_displayed
        return displayed?(BTN_TOP_ADD_TO_BASKET)
    end

    def add_to_bag_bottom_displayed
        return displayed?(BTN_BOTTOM_ADD_TO_BASKET)
    end

    def extended_warranty_displayed
        return displayed?(CHECK_WARRANTY)
    end

    def is_product_title_displayed
        return displayed?(TXT_PRODUCT_TITLE)
    end

    def get_product_title
        return text_of(TXT_PRODUCT_TITLE)
    end

    def is_product_price_displayed
        return displayed?(TXT_PRODUCT_PRICE)
    end

    def get_product_price
        return text_of(TXT_PRODUCT_PRICE).to_f
    end

    def is_product_currency_sym_displayed
        return displayed?(TXT_PRODUCT_CURRENCY_SYM)
    end

    def get_currency_sym
        return text_of(TXT_PRODUCT_CURRENCY_SYM)
    end
    
end