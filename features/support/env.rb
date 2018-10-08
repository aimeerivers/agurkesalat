require 'capybara'
require 'capybara/cucumber'
require 'selenium/webdriver'
require 'selenium/webdriver/common/wait'
require 'retriable'
require 'rspec'

Capybara.app_host = 'https://www.dr.dk'
Capybara.default_driver = :selenium_grid_firefox

Capybara.register_driver :selenium_grid_firefox do |app|
  Capybara::Selenium::Driver.new(app,
    :browser => :remote,
    :url => "http://selenium_hub:4444/wd/hub",
    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.firefox)
end

Capybara.register_driver :selenium_grid_chrome do |app|
  Capybara::Selenium::Driver.new(app,
    :browser => :remote,
    :url => "http://selenium_hub:4444/wd/hub",
    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome)
end

Retriable.configure do |c|
  c.on = RSpec::Expectations::ExpectationNotMetError
  c.base_interval = 0.1
  c.tries = 50
end

After do |scenario|
  page.driver.reset!
end

def debug(page)
  time = Time.now.strftime('%Y-%m-%d_%H-%M-%S-%L')
  page.save_screenshot("./skaermbilleder/#{time}.png")
  page.save_page("./skaermbilleder/#{time}.html")
end
