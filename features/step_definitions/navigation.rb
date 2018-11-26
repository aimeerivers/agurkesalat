include CookiesHelper

Givet("jeg er på DRDKs hjemmeside") do
  visit '/'
  accept_cookies
end

Så("skal jeg se {string} i titlen") do |word|
  expect(page.title).to include word
end

Når("jeg ændrer vindue størrelse til {int} x {int}") do |width, height|
  page.driver.browser.manage.window.resize_to(width, height)
end
