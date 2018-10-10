include CookiesHelper

Givet("jeg er på DRDKs søgside") do
  visit '/search'
  accept_cookies
  expect(page.title.downcase).to include('søg')
end

Når("jeg søger efter {string}") do |søg|
  fill_in 'searchInput', with: søg
  click_button 'Søg'
end

Så("skal jeg finde nogle resultater") do
  resultater = all('.js-list-container li')
  expect(resultater).not_to be_empty
end

Så("skal jeg finde ingen resultater") do
  expect(page).to have_text "ingen resultater"
end
