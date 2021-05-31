require_relative  '../utils/spec_helper.rb'

describe 'Desktop - Footer' do
    before(:all) do
        @home_page.open()
        @footer.scroll_to_footer
    end
    it 'displays \'Apple Pay\' as a Payment Option' do
        expect(@footer.apple_pay_is_displayed).to be true
    end
	it 'displays \'Visa\' as a Payment Option' do
        expect(@footer.visa_is_displayed).to be true
    end
	it 'displays \'Mastercard\' as a Payment Option' do
        expect(@footer.mastercard_is_displayed).to be true
    end
	it 'displays \'American Express\' as a Payment Option' do
        expect(@footer.amex_is_displayed).to be true
    end
    it 'displays \'Finance\' as a Payment Option' do
        expect(@footer.finance_is_displayed).to be true
    end
	it 'displays \'PayPal\' as a Payment Option' do
        expect(@footer.paypal_is_displayed).to be true
    end
	it 'confirms \'Log In\' link is present' do
        expect(@footer.log_in_link_displayed).to be true
    end
	it 'clicks the \'Log In\' link and is navigated to the \'Login page\'' do
        @footer.navigate_to_log_in_page
        expect(@login_page.log_in_form_is_displayed).to be true
    end

end