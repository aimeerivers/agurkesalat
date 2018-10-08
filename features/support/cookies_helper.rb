module CookiesHelper

  def accept_cookies
    cookie_buttons = page.all('#CybotCookiebotDialogBodyButtonAccept')
    cookie_buttons.first.click if cookie_buttons.any?
    
    Retriable.retriable do
      expect(page.all('#CybotCookiebotDialogBodyUnderlay')).to be_empty
    end
  end

end
