When /^Login to ProcessMaker app as Administrator$/ do
  @login = Login.new
  @login.load

  page.driver.browser.manage.window.maximize

  @login.authenticate $admin_user,$admin_psw, $default_lang
  sleep(2)
end

When /^Login to ProcessMaker app with (.*), (.*) credentials and (.*) language$/ do |user,psw,lang|
  @login = Login.new
  @login.load

  page.driver.browser.manage.window.maximize

  @login.authenticate $admin_user,$admin_psw, $default_lang
end


When /^The login page of ProcessMaker app is Loaded$/ do
  @login = Login.new
  @login.load

  page.driver.browser.manage.window.maximize
end

Then /^Fill the username field with (.*)$/ do |usr|
  @login.username_field.set usr
end

And /^Fill the password field with (.*)$/ do |psw|
  @login.password_field.set psw
end

And /^Select the (.*) language to manage the app$/ do |lang|
  @login.language_dd.set lang
end

Then /^Click on (.*) button$/ do |loginBtn|
  @login.login_button.click

  # The 'sleep' function is called to display the Homepage for the defined time inside it.
  sleep (10)

end

Then /^The Homepage is displayed$/ do
  @home = Home.new
  @home.load

  @home.wait_for_main_menu(10)
  @home.wait_until_main_menu_visible(10)
  expect(@home.has_main_menu?).to eq(true)
end

And /^Click on (.*) link$/ do
  @login.logout_link.click
end

Then /^Open (.*) page$/ do |company_page|
  @login = Login.new
  @login.load

  page.driver.browser.manage.window.maximize
  @login.colosa_page.click
end