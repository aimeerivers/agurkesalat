include CookiesHelper

Givet("jeg er på DRTVs forside") do
  visit '/tv'
  accept_cookies
end

Når("jeg klikker på hver hero program link") do
  @items = []
  
  3.times do |gang|
    swipe_carousel(:right, gang)

    hero_title = all('#front-carousel .owl-item h2')[-1].text.split("\n").first
    all('#front-carousel .owl-item')[-1].click
    page_title = find('#player-title').text

    @items << { hero_title: hero_title, page_title: page_title }

    page.back
  end
end

Så("skal jeg gå til den korrekte program side") do
  @items.each do |item|
    expect(item[:page_title]).to eq item[:hero_title]
  end
end

def swipe_carousel(retning, gang)
  title = all('#front-carousel .owl-item h2')[-1].text
  gang.times do
    page.find("#front-#{retning}-arrow").click
    Retriable.retriable do
      expect(all('#front-carousel .owl-item h2')[-1].text).to_not be nil
      expect(all('#front-carousel .owl-item h2')[-1].text).to_not eq title
    end
  end
end