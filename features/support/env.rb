require 'capybara'
require 'capybara/cucumber'
require 'selenium/webdriver'
require 'selenium/webdriver/common/wait'

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

After do |scenario|
  page.driver.reset!
end