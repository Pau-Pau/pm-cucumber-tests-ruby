And /^Click on the (.*) link in order to create a DynaForm$/ do |dynaForm|
  @home.designer_iframe do |designer_frame|
    designer_frame.new_process_dialog.create_process.click

    designer_frame.process_submenu.dynaForm_dialog.new_dynaForm_link.click
    sleep(5)
  end
end
