And /^Go to (.*) menu$/ do |menu|
  @home = Home.new
  @home.load

  @home.wait_for_main_menu(10)
  @home.wait_until_main_menu_visible(10)
  expect(@home.has_main_menu?).to eq(true)

  @home.main_menu.wait_for_designer(10)
  @home.main_menu.wait_until_designer_visible(10)
  expect(@home.main_menu.has_designer?).to eq(true)

  @home.go_to_menu menu

  @home.designer_iframe do |iframe|
    iframe.wait_for_new_process_button(5)
    iframe.wait_until_new_process_button_visible(5)
    expect(iframe.has_new_process_button?).to eq(true)
    expect(iframe.has_edit_process_button?).to eq(true)
  end
end

