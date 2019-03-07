STDOUT.sync = true

require 'capybara'
require 'capybara/cucumber'
require 'selenium/webdriver'
require 'selenium/webdriver/common/wait'
require 'retriable'
require 'rspec'
require 'allure-cucumber'
require 'pry'

Capybara.app_host = ENV.fetch('TEST_DOMAIN', 'https://www.dr.dk')

Retriable.configure do |c|
  c.on = RSpec::Expectations::ExpectationNotMetError
  c.base_interval = 0.1
  c.tries = 10
end

# Before do
#   page.driver.browser.manage.window.resize_to(1280, 1024)
# end

AllureCucumber.configure do |c|
  c.clean_dir  = false
  c.issue_prefix    = '@QA-'
end

class Cucumber::Core::Test::Step
  def name
    return text if self.text == 'Before hook'
    return text if self.text == 'After hook'
    "#{source.last.keyword}#{text}"
  end
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
