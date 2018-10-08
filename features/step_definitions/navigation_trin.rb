Givet("jeg er på DRDKs hjemmeside") do
  visit '/'
end

Så("skal jeg se {string} i titlen") do |ord|
  expect(page.title).to include ord
end
