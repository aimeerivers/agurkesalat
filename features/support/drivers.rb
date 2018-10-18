selenium_hub_addr = ENV['SELENIUM_HUB_ADDR'] || 'selenium_hub'
selenium_hub_port = ENV['SELENIUM_HUB_PORT'] || '4444'
selenium_url = "http://#{selenium_hub_addr}:#{selenium_hub_port}/wd/hub"

drivers = {
  selenium_grid_firefox: Selenium::WebDriver::Remote::Capabilities.firefox,
  selenium_grid_chrome: Selenium::WebDriver::Remote::Capabilities.chrome,
  selenium_grid_safari: Selenium::WebDriver::Remote::Capabilities.safari,
  selenium_grid_ie: Selenium::WebDriver::Remote::Capabilities.internet_explorer
}

drivers.each do |key, driver|
  Capybara.register_driver key do |app|
    Capybara::Selenium::Driver.new(app,
      :browser => :remote,
      :url => selenium_url,
      :desired_capabilities => driver)
  end
end

case ENV['TEST_ENV']
when 'firefox'
  Capybara.default_driver = :selenium_grid_firefox
when 'chrome'
  Capybara.default_driver = :selenium_grid_chrome
when 'safari'
  Capybara.default_driver = :selenium_grid_safari
when 'ie'
  Capybara.default_driver = :selenium_grid_ie
else
  Capybara.default_driver = :selenium_grid_firefox
end
