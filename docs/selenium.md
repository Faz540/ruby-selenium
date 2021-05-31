# Selenium Ruby Cheat Sheet:

## Creating Browser Instance:
[List of Chrome Args](https:#peter.sh/experiments/chromium-command-line-switches/)  
[List of Chrome Options](https:#chromedriver.chromium.org/capabilities)

```ruby
    driver = Selenium::WebDriver.for(:chrome)
    driver = Selenium::WebDriver.for(:chrome, :args => ['--headless', '--disable-gpu'])
    driver = Selenium::WebDriver.for(:firefox)
    driver = Selenium::WebDriver.for(:firefox, :args => ['-headless'])
```

## Driver:
```ruby
    driver.close() # Close the current window, or the browser if no windows are left.
    driver.current_url() # Returns current URL as string
    driver.execute_script('return window.cookies', arguments) # Execute JS
    driver.get('url') # Navigate to a URL, but DOES NOT maintain the browser history and cookies
    driver.quit() # Quits all browser sessions
    driver.switch_to() #
    driver.title() # Returns the page title
    driver.switch_to() #
    driver.window_handle() #
    driver.window_handles() #
    driver.save_screenshot('file_path_with_image_name.png') # Only use .png
    driver.action.send_keys(:escape).perform # Sending keystrokes without specifiying an element
    # (:tab, :escape, :return, :enter, :control, :space, :home, :end)
```

## Find:
```ruby
    driver.find_element(:css, 'css_locator') # Returns 1 Element
    driver.find_elements(:css, 'css_locator') # Returns Multiple Elements
    # (:class, :class_name, :id, :link_text, :link, :partial_link_text, :name, :tag_name, :xpath)

    driver.find_element(:css, '#example')
    *.attribute('name_of_attribute')
    *.clear()
    *.click()
    *.displayed? # true or false
    *.enabled? # true or false
    *.hover()
    *.select()
    *.send_keys('string')
    *.send_keys(:escape) # You can also send key strokes to a given element
    # (:tab, :escape, :return, :enter, :control, :space, :home, :end)
    *.stlye('style_property')
    *.submit()
    *.tag_name()
    *.text() # Get the element's text content
    *.toggle()
    *.value() # Get the element's value
```

## Navigation:
```ruby
    driver.navigate.back()
    driver.navigate.forward()
    driver.navigate.refresh()
    driver.navigate.to('url') # Navigate to a URL, but maintains the browser history and cookies
```

## Options:
```ruby
    driver.manage.add_cookie({ :name => '', :value => '', :path => '', :secure => '' })
    driver.manage.all_cookies() # Returns an array of cookies
    driver.manage.delete_all_cookies()
    driver.manage.delete_cookie('name_of_cookie')
    driver.manage.timeouts.implicit_wait = 0 # seconds
    driver.manage.timeouts.page_load = 2 # seconds
```

## Switch To:
```ruby
    iframe = driver.find_element(:css, 'locator_for_iframe')
    driver.switch_to.frame(iframe)

    driver.switch_to.alert.accept # Accept JS Alert Popup
```

## Platform:
```ruby
    driver.platform.linux? # true or false
    driver.platform.mac? # true or false
    driver.platform.wind? # true or false
    driver.platform.os # Returns an object
```

## Set Screen Size:
```ruby
    screen_size = Selenium::WebDriver::Dimension.new(1400, 900)
    driver.manage.window.size = screen_size
```