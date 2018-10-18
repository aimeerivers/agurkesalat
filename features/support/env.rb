require 'capybara'
require 'capybara/cucumber'
require 'selenium/webdriver'
require 'selenium/webdriver/common/wait'
require 'retriable'
require 'rspec'

Capybara.app_host = 'https://www.dr.dk'

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

selenium_hub_addr = ENV['SELENIUM_HUB_ADDR'] || 'selenium_hub'
selenium_hub_port = ENV['SELENIUM_HUB_PORT'] || '4444'
selenium_url = "http://#{selenium_hub_addr}:#{selenium_hub_port}/wd/hub"

Capybara.register_driver :selenium_grid_firefox do |app|
  Capybara::Selenium::Driver.new(app,
    :browser => :remote,
    :url => selenium_url,
    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.firefox)
end

Capybara.register_driver :selenium_grid_chrome do |app|
  Capybara::Selenium::Driver.new(app,
    :browser => :remote,
    :url => selenium_url,
    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome)
end

Capybara.register_driver :selenium_grid_safari do |app|
  Capybara::Selenium::Driver.new(app,
    :browser => :remote,
    :url => selenium_url,
    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.safari)
end

Capybara.register_driver :selenium_grid_ie do |app|
  Capybara::Selenium::Driver.new(app,
    :browser => :remote,
    :url => selenium_url,
    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.internet_explorer)
end

Retriable.configure do |c|
  c.on = RSpec::Expectations::ExpectationNotMetError
  c.base_interval = 0.1
  c.tries = 10
end

Before do
  page.driver.browser.manage.window.resize_to(1280, 1024)
end

After do |scenario|
  debug page if scenario.failed?
  page.driver.reset!
end

def debug(page)
  time = Time.now.strftime('%Y-%m-%d_%H-%M-%S-%L')
  page.save_screenshot("./skaermbilleder/#{time}.png")
  page.save_page("./skaermbilleder/#{time}.html")
end
