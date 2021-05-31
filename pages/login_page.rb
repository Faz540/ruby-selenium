require_relative  './template_page.rb'

class LoginPage < PageTemplate

    def initialize(driver)
        super(driver)
    end

    # Elements:
    FORM_LOGIN = { css: '#login_form' }

    def log_in_form_is_displayed
        return displayed?(FORM_LOGIN)
    end

end