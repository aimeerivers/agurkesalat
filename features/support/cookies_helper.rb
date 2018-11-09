module CookiesHelper

  def accept_cookies
    sleep 0.5
    cookie_buttons = page.all('#CybotCookiebotDialogBodyButtonAccept')
    if cookie_buttons.any?
      cookie_buttons.first.click
      sleep 0.5
      page.driver.browser.navigate.refresh
    end
  end

end
