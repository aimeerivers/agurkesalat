module CookiesHelper

  def accept_cookies
    cookie_buttons = page.all('#CybotCookiebotDialogBodyButtonAccept')
    cookie_buttons.first.click if cookie_buttons.any?
    
    Retriable.retriable {
      expect(page.all('#CybotCookiebotDialogBodyButtonAccept')).to be_empty
    }
  end

end
