include CookiesHelper

Givet("jeg er på radio-oversigten") do
  visit '/radio/oversigt'
  accept_cookies
  debug page
end

Når("jeg tilføjer {string} som en Favoritkanal") do |kanal|
  click_button 'Vælg favoritkanaler'
  sleep 1
  debug page
  sleep 1
  within('.channelList') { find('div', text: kanal).click }
  first('button', text: 'GEM').click
end

Så("skal jeg se kun de følgende kanaler:") do |table|
  ønsket_kanaler = table.raw.flatten

  Retriable.retriable do
    all(".channels .logo").size.should eq ønsket_kanaler.size
  end

  ønsket_kanaler.each_with_index do |ønsket_kanal, index|
    all(".channels .logo")[index].first("div")[:title].should eq ønsket_kanal
  end
end
