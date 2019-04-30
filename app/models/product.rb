require 'webdrivers'
require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

class Product < ApplicationRecord
  def discounted?
    run do
      @driver.get url
      begin
        element = @driver.find_element(class: 'superPriceIconLarge')
        return element.displayed?
      rescue
        return false
      end
    end
  end

  private

  def setup
    #Webdrivers::Chromedriver.update
    # Selenium::WebDriver::Chrome::Service.driver_path = Rails.public_path.to_s + "/chromedriver"
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    #options.add_argument('--disable-gpu')
    #options.add_argument('--no-sandbox')
    @driver = Selenium::WebDriver.for :chrome, options: options
    #@driver = Selenium::WebDriver.for :chrome
    # @driver.manage.window.resize_to(1300, 500)
  end

  def teardown
    @driver.quit
  end

  def run
    setup
    yield
    teardown
  end
end

