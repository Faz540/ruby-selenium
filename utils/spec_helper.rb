require 'dotenv'
require 'rspec/expectations'
require 'rspec'
require 'selenium-webdriver'
require 'webdrivers'
require 'require_all'

Dotenv.load

# Require all our Page Object Files
begin
  require_all './pages/*.rb'
rescue
  puts 'no page objects found'  
end

RSpec.configure do | config |
  config.before(:all) do | test |
    $base_url = ENV["BASE_URL"] || 'https://www.gear4music.com'

    if ENV["HEADLESS"] == 'TRUE' 
      options = Selenium::WebDriver::Chrome::Options.new(args: ['--headless', '--disable-gpu'])
      @driver = Selenium::WebDriver.for(:chrome, options: options)
    else
      @driver = Selenium::WebDriver.for(:chrome)
    end

    screen_size = Selenium::WebDriver::Dimension.new(1400, 900)
    @driver.manage.window.size = screen_size
    @driver.manage.timeouts.implicit_wait = 5

    # Pages:
    @header = HeaderMenu.new(@driver)
    @footer = FooterMenu.new(@driver)
    @cookie_banner = Cookie_Banner.new(@driver)

    @home_page = HomePage.new(@driver)
    @login_page = LoginPage.new(@driver)
    @search_results_page = SearchResultsPage.new(@driver)
    @pdp = PDP.new(@driver)
    @basket_page = BasketPage.new(@driver)
    
    @driver.navigate.to($base_url)
    @cookie_banner.close_cookie_banner
  end

  config.after(:all) do | test |
    @driver.quit
  end

end