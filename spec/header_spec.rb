require_relative  '../utils/spec_helper.rb'

describe 'Desktop - Header' do
    describe 'Basket Navigation' do
        it 'clicks the Basket icon and is navigated to an empty basket page' do
            @header.navigate_to_basket_page()
            expect(@basket_page.get_number_of_basket_items()).to be == 0
        end
        it 'clicks the Basket icon and is navigated to a populated basket page' do
            @basket_page.quick_add_to_basket('7022')
            expect(@basket_page.get_number_of_basket_items()).to be == 1
        end
    end
    describe 'Search', :smoke => true do
        before(:each) do
            @home_page.open()
        end
        it 'performs a search and results are returned', :smoke => true do
            @header.search_for('red')
            expect(@search_results_page.get_number_of_results()).to be >= 1
        end
        it 'searches for a brand and is redirected to a brand PLP', :smoke => true do 
            @header.search_for('fender')
            expect(@driver.current_url()).to include('/Manufacturer/Fender.html')
        end
        it 'searches for a category and is redirected to a category PLP' do 
            @header.search_for('xylophone')
            expect(@driver.current_url()).to include('/orchestral/percussion/xylophones')
        end
        it 'searches using a product id and 1 match is returned' do 
            @header.search_for('7022')
            expect(@search_results_page.get_number_of_results()).to be == 1
        end
    end
    describe 'Nav Menu', :smoke => true do
        before(:all) do
            @home_page.open()
        end
        it 'displays the Nav Menu', :smoke => true do
            expect(@header.is_nav_menu_displayed).to be true
        end
        it 'clicks the \'Bass Guitars\' Nav link and is successfully navigated', :smoke => true do
            @header.click_parent_nav_menu_link('/bass-guitars')
            expect(@driver.current_url).to include('/bass-guitars')
        end
    end
end