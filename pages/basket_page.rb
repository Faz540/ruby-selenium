require_relative  './template_page.rb'

class BasketPage < PageTemplate
    
    def initialize(driver)
        super(driver)
    end
    
    # Elements:
    FORM_BASKET = { css: '#basket-form' }
    TABLE_BASKETS = { css: '.table-g4m-basket' }
    ROW_ORDER_LINES = { css: '.product-listing' }
    CHECK_WARRANTY = { css: '.select-warranty' }
    LINK_REMOVE_ITEM = { css: '.remove-basket-line' }
    DROP_ITEM_QUANTITY = { css: '.update-basket-line-qty' }
    OPTION_CURRENT_QUANTITY = { css: '.update-basket-line-qty [selected]' }
    RADIO_DELIVERY_OPTIONS = { css: '.service-category-input' }
    BTN_PROCEED_BOTTOM = { css: '#basket-checkout-btn-bottom' }
    
    # Methods:
    def empty_the_basket
        open('/basket/empty')
        wait_for_element_to_be_visible(FORM_BASKET)
    end
    
    def quick_add_to_basket(product_id)
        open("/basket/add?int_product_id=#{product_id}")
        wait_for_element_to_be_visible(FORM_BASKET)
    end
    
    def get_number_of_basket_items
        return length_of(ROW_ORDER_LINES)
    end
    
    def is_warranty_added
        return get_attribute(CHECK_WARRANTY, 'checked')
    end
    
    def remove_basket_item
        click_on(LINK_REMOVE_ITEM)
        wait_for_loading_overlay_to_not_exist
    end
    
    def update_quantity(quantity)
        select_by(DROP_ITEM_QUANTITY, :value, quantity)
        wait_for_loading_overlay_to_not_exist
    end
    
    def get_current_quantity
        return text_of(OPTION_CURRENT_QUANTITY).to_i
    end
    
    def get_number_of_delivery_options
        return length_of(RADIO_DELIVERY_OPTIONS)
    end
    
    def proceed_to_checkout
        click_on(BTN_PROCEED_BOTTOM)
        wait_for_element_to_not_exist(FORM_BASKET)
    end

    def is_proceed_to_checkout_displayed
        return displayed?(BTN_PROCEED_BOTTOM)
    end

    def get_number_of_baskets
        return length_of(TABLE_BASKETS)
    end
        
end
