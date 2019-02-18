module CookiesHelper

  def accept_cookies(options = {})
    if options[:explicit_click]
      sleep 0.5
      cookie_buttons = page.all('#CybotCookiebotDialogBodyButtonAccept')
      if cookie_buttons.any?
        cookie_buttons.first.click
        sleep 0.5
        page.driver.browser.navigate.refresh
      end
    else
      page.execute_script(%Q{document.cookie = "CookieConsent={stamp:'CuZcRMETDBzzXrvOSRUm3NdONNifYwwAIxGSfRITWhTTtCfsa56iuw=='%2Cnecessary:true%2Cpreferences:true%2Cstatistics:true%2Cmarketing:true%2Cver:2}";})
      page.driver.browser.navigate.refresh
    end
  end

end
