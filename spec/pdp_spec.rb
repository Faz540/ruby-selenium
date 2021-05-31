require_relative  '../utils/spec_helper.rb'

product_id = 42518

describe 'Desktop - PDP' do
    describe 'Visibility Checks' do
        before(:all) do
            @pdp.open("/g4m/#{product_id.to_s(36)}")
        end
        it 'displays the \'Add To Basket\' button (Top)', :smoke => true do
            expect(@pdp.add_to_bag_top_displayed).to be true
        end
        it 'displays the \'Add To Basket\' button (Bottom)', :smoke => true do
            expect(@pdp.add_to_bag_bottom_displayed).to be true
        end
        it 'displays the product\'s title' do
            expect(@pdp.is_product_title_displayed).to be true
            expect(@pdp.get_product_title.empty?).to be false
        end
        it 'displays the product\'s price', :smoke => true do
            expect(@pdp.is_product_price_displayed).to be true
            expect(@pdp.get_product_price).to be > 1
        end
        it 'displays the desired currency symbol (£)' do
            expect(@pdp.is_product_currency_sym_displayed).to be true
            expect(@pdp.get_currency_sym).to eq "£"
        end
        it 'displays the \'Extended Warranty\' checkbox' do
            expect(@pdp.extended_warranty_displayed).to be true
        end
        it 'displays at least one \'Similar Product\'' do
            expect(@pdp.number_of_similar_products).to be >= 1
        end
        it 'displays at least one \'Related Product\'' do
            expect(@pdp.number_of_related_products).to be >= 1
        end
    end
    describe 'Functional Checks' do
        before(:each) do
            @pdp.open("/g4m/#{product_id.to_s(36)}")
        end
        after(:each) do
            @basket_page.empty_the_basket
        end
        it 'successfully adds to basket (Top Button)', :smoke => true do
            @pdp.click_top_add_to_basket
            expect(@basket_page.get_number_of_basket_items()).to be == 1
        end
        it 'successfully adds to basket (Bottom Button)', :smoke => true do
            @pdp.click_bottom_add_to_basket
            expect(@basket_page.get_number_of_basket_items()).to be == 1
        end
        it 'successfully adds \'Extended Warranty\' (Top Button)', :smoke => true do
            @pdp.select_warranty
            @pdp.click_top_add_to_basket
            expect(@basket_page.get_number_of_basket_items()).to be == 1
            expect(@basket_page.is_warranty_added).to eql('true')
        end
        it 'successfully adds \'Extended Warranty\' (Bottom Button)', :smoke => true do
            @pdp.select_warranty
            @pdp.click_bottom_add_to_basket
            expect(@basket_page.get_number_of_basket_items()).to be == 1
            expect(@basket_page.is_warranty_added).to eql('true')
        end
        it 'successfully adds a \'Related Product\'' do
            @pdp.select_related_product
            @pdp.click_bottom_add_to_basket
            expect(@basket_page.get_number_of_basket_items()).to be == 2
        end
        it 'successfully adds a \'Related Product\' and \'Extended Warranty\'' do
            @pdp.select_warranty
            @pdp.select_related_product
            @pdp.click_bottom_add_to_basket
            expect(@basket_page.get_number_of_basket_items()).to be == 2
            expect(@basket_page.is_warranty_added).to eql('true')
        end
    end
end