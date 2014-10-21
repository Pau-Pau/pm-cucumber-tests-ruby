And /^Go to (.*) menu$/ do |menu|
  @home = Home.new
  @home.load
  @home.wait_for_main_menu(30)
  @home.wait_until_main_menu_visible(30)
  expected(@home._main_menu.has_designer?).to eq(true)

  @home.go_to_menu menu
  sleep(5)
end

