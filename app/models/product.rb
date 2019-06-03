require 'webdrivers'
require 'selenium-webdriver'

class Product < ApplicationRecord
  belongs_to :alert
  validates :url, presence: true
  validate :url_must_be_valid, :url_must_have_protocol

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

  def url_must_be_valid
    unless url.include?("continente.pt")
      errors.add(:url, "must be from a continente.pt product.")
    end
  end

  def url_must_have_protocol
    unless url.include?("http") || url.include?("https")
      errors.add(:url, "must contain http or https.")
    end
  end
end
