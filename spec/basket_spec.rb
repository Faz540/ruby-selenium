require_relative  '../utils/spec_helper.rb'

product_id = '7022'
bundle_id = '109657'
digital_id = '170369'

describe 'Desktop - Basket' do
    describe 'Single Item Basket', :smoke => true do
        describe 'Visibility Checks' do
            before(:all) do
                @basket_page.empty_the_basket
                @basket_page.quick_add_to_basket(product_id)
            end
            it 'displays 1 item' do
                expect(@basket_page.get_number_of_basket_items).to be == 1
            end
            it 'displays at least one delivery option' do
                expect(@basket_page.get_number_of_delivery_options).to be >= 1
            end
            it 'displays the \'Proceed To Checkout\' button' do
                expect(@basket_page.is_proceed_to_checkout_displayed).to be true
            end
        end
        describe 'Functionality Checks' do
            before(:each) do
                @basket_page.empty_the_basket
                @basket_page.quick_add_to_basket(product_id)
            end
            it 'increases a single line item\'s quantity' do
                @basket_page.update_quantity('2')
                expect(@basket_page.get_current_quantity).to be == 2
            end
            it 'decreases a single line item\'s quantity' do
                @basket_page.update_quantity('3')
                @basket_page.update_quantity('2')
                expect(@basket_page.get_current_quantity).to be == 2
            end
            it 'removes the only item from the basket' do
                @basket_page.remove_basket_item
                expect(@basket_page.get_number_of_basket_items).to be == 0
            end
        end
    end
    describe 'Multi Item Basket', :smoke => true do
        describe 'Visibility Checks' do
            before(:all) do
                @basket_page.empty_the_basket
                @basket_page.quick_add_to_basket(product_id)
                @basket_page.quick_add_to_basket(bundle_id)
            end
            it 'displays 2 items' do
                expect(@basket_page.get_number_of_basket_items).to be == 2
            end
        end
        describe 'Functionality Checks' do
            before(:each) do
                @basket_page.empty_the_basket
                @basket_page.quick_add_to_basket(product_id)
                @basket_page.quick_add_to_basket(bundle_id)
            end
            it 'removes 1 of 2 items, leaving 1 item remaining' do
                @basket_page.remove_basket_item
                expect(@basket_page.get_number_of_basket_items).to be == 1
            end
        end
    end
    describe 'Split Basket' do
        describe 'Visibility Checks' do
            before(:each) do
                @basket_page.empty_the_basket
                @basket_page.quick_add_to_basket(product_id)
                @basket_page.quick_add_to_basket(digital_id)
            end
            it 'creates a split basket (Digital + Normal)' do
                expect(@basket_page.get_number_of_baskets).to eql 2
            end
        end        
    end    
    describe 'Navigation Checks', :smoke => true do
        before(:all) do
            @basket_page.empty_the_basket
            @basket_page.quick_add_to_basket(product_id)
        end
        it 'can progress to the \'Guest - Your Details Page\'' do
            @basket_page.proceed_to_checkout
            expect(@driver.current_url).to include('/registration/index')
        end 
    end
end
