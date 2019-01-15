require 'selenium/webdriver/remote/http/persistent'

selenium_hub_addr = ENV.fetch('SELENIUM_HUB_ADDR', 'selenium_hub')
selenium_hub_port = ENV.fetch('SELENIUM_HUB_PORT', '4444')
selenium_url = "http://#{selenium_hub_addr}:#{selenium_hub_port}/wd/hub"

Capybara.register_driver :selenium_grid do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.new
  capabilities.browser_name = ENV.fetch('BROWSER', 'chrome')
  capabilities.platform = ENV.fetch('PLATFORM', :any)
  capabilities.javascript_enabled = true
  capabilities.takes_screenshot = true
  capabilities['ie.ensureCleanSession'] = true

  client = Selenium::WebDriver::Remote::Http::Persistent.new

  driver_options = {
    browser: :remote,
    url: selenium_url,
    desired_capabilities: capabilities,
    http_client: client
  }
  Capybara::Selenium::Driver.new app, driver_options
end

Capybara.default_driver = :selenium_grid
