class PageTemplate
    
    def initialize(driver)
        @driver = driver
    end
    
    def open(path = '/')
        @driver.navigate.to($base_url + path)
    end
    
    def find(locator)
        @driver.find_element(locator)
    end

    def find_all(locator)
        @driver.find_elements(locator)
    end
    
    def clear(locator)
        find(locator).clear
    end
    
    def type(locator, input)
        clear(locator)
        find(locator).send_keys(input)
    end
    
    def click_on(locator)
        find(locator).click
    end
    
    def displayed?(locator)
        begin
            find(locator).displayed?
            return true
        rescue Selenium::WebDriver::Error::NoSuchElementError
            @driver.save_screenshot('screenshots/not_displayed.png')
            return false
        end
    end
    
    def exists?(locator)
        begin
            find(locator)
            return true
        rescue Selenium::WebDriver::Error::NoSuchElementError
            @driver.save_screenshot('screenshots/not_existing.png')
            return false
        end
    end
    
    def text_of(locator)
        find(locator).text
    end
    
    def length_of(locator)
        return @driver.find_elements(locator).length
    end
    
    def get_attribute(locator, attribute)
        find(locator).attribute(attribute)
    end
    
    def select_by(locator, attribute, value)
        dropdown_menu = @driver.find_element(locator)
        dropdown_options = Selenium::WebDriver::Support::Select.new(dropdown_menu)
        dropdown_options.select_by(attribute, value)
    end
    
    def wait_for_element_to_be_visible(locator)
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        wait.until{ displayed?(locator) }
    end

    def wait_for_element_to_not_be_visible(locator)
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        wait.until{ !displayed?(locator) }
    end

    def wait_for_element_to_exist(locator)
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        wait.until{ exists?(locator) }
    end

    def wait_for_element_to_not_exist(locator)
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        wait.until{ !exists?(locator) }
    end

    def wait_for_loading_overlay_to_not_exist
        wait_for_element_to_not_exist({css: '.overlay-loading'})
    end

    def press_key(key)
        @driver.action.send_keys(key).perform
    end
    
end