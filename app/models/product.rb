require 'webdrivers'
require 'selenium-webdriver'

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
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    @driver = Selenium::WebDriver.for :chrome, options: options
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

