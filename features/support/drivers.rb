selenium_hub_addr = ENV.fetch('SELENIUM_HUB_ADDR', 'selenium_hub')
selenium_hub_port = ENV.fetch('SELENIUM_HUB_PORT', '4444')
selenium_url = "http://#{selenium_hub_addr}:#{selenium_hub_port}/wd/hub"

Capybara.register_driver :selenium_grid do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.new
  capabilities.browser_name = ENV.fetch('BROWSER', 'firefox')
  capabilities.platform = ENV.fetch('PLATFORM', :any)
  capabilities.javascript_enabled = true
  capabilities.takes_screenshot = true
  capabilities['ie.ensureCleanSession'] = true

  driver_options = {
    browser: :remote,
    url: selenium_url,
    desired_capabilities: capabilities,
  }
  Capybara::Selenium::Driver.new app, driver_options
end


desired_caps_ios = {
  platformName:    "iOS",
  platformVersion: "12.0",
  deviceName:      "iPad (5th generation)",
  browserName:     "safari",
  automationName:  "XCUITest"
}

url = "http://10.112.12.201:4723/wd/hub" # or a sauce labs url

Capybara.register_driver(:appium) do |app|
    appium_lib_options = {
      server_url:           url
    }
    all_options = {
      appium_lib:  appium_lib_options,
      caps:        desired_caps_ios
    }
    Appium::Capybara::Driver.new app, all_options
end


Capybara.default_driver = :selenium_grid
# Capybara.default_driver = :appium
