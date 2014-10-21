require 'rubygems'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/node/matchers'
require 'capybara/cucumber'
require 'rspec/expectations'
require 'rspec/matchers'
require 'site_prism'
require 'site_prism/waiter'

####################################
## Browsers Definition            ##
####################################

# :Firefox -> Defaul browser
Capybara.default_driver = :selenium

# :Chrome defined by user
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

# :Intenet Explorer defined by user
Capybara.register_driver :internet_explorer do |app|
  Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
end

####################################
## Constants and Global Libraries ##
####################################

# LOCAL_ENVIRONMENT = 'http://processmaker.com:8080/'
LOCAL_ENVIRONMENT = 'http://127.0.0.1:8080/sysworkflow/en/neoclassic/login/login'

$wait = Selenium::WebDriver::Wait.new(:timeout => 90)
$url_login = LOCAL_ENVIRONMENT
$admin_user = 'admin'
$admin_psw = 'admin'
$default_lang = 'English'
