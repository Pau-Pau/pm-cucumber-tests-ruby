class Header_section < SitePrism::Section
  element :logout_link, "a", text: "Logout"
  element :workflow_link, "u", text: "workflow"
end

class Main_Menu_section < SitePrism::Section
  element :home, "#CASES"
  element :designer, "#PROCESSES"
  element :dashboards, "#DASHBOARD"
  element :admin, "#SETUP"
end

class New_Process_dialog < SitePrism::Section
  element :dialog_title, "#ext-gen106"
  element :close_dialog_icon, "#ext-gen102"
  element :process_name, "#PRO_TITLE"
  element :process_description, "#PRO_DESCRIPTION"
  element :process_category_dd , "#ext-gen233"
  #element :create_process, "#ext-gen103"
  #element :cancel_process_creation, "#ext-gen105"
  element :create_process, "button", text: "Create"
  element :cancel_process_creation, "button", text: "Cancel"
end

class Process_SubMenu_section < SitePrism::Section
  element :dynaforms, "#DYNAFORMS a"
  element :input_docs, "#INPUTDOCS a"
  element :output_docs, "#OUTPUTDOCS a"
  element :triggers, "#TRIGGERS a"
  element :report_tables, "#REPORT_TABLES a"
  element :db_connections, "#DB_CONNECTIONS a"
  element :case_scheduler, "#CASE_SCHEDULER a"
end

class DynaForm_dialog < SitePrism::Section
  element :new_dynaForm_link, "a[id='form[MNU_ADD]']"
  element :search_dynaForm_field, "input[id='form[PAGED_TABLE_FAST_SEARCH]']"
end

class Designer_iframe < SitePrism::Page

  # Process manage elements located in the iframe header
  element :new_process_button,  "#ext-gen33"
  element :edit_process_button, "#ext-gen37"
  element :status_process_button, "#ext-gen39"
  element :delete_process_button, "#ext-gen41"
  element :export_process_button, "#ext-gen45"
  element :import_process_button, "#ext-gen47"
  element :process_category_filter, "#ext-gen56"
  element :search_process_field, "#searchTxt"
  element :search_process_button, "#ext-gen63"
  element :first_checkbox_of_table, "#ext-gen24"

  section :new_process_dialog, New_Process_dialog, "#newProjectWin"
  section :process_submenu, Process_SubMenu_section, "#pm_submenu"
  section :dynaForm_dialog, DynaForm_dialog, ".panel_frontend___processmaker"

  # Task manager icons located in the right above
  element :sequential, "img", title: "Sequential"
  element :selection, "img", title: "Selection"
  element :evaluation, "img", title: "Evaluation"
  element :parallel_fork, "img", title: "Parallel (fork)"
  element :parallel_by_evaluation_fork, "img", title: "Parallel by Evaluation (fork)"
  element :parallel_join, "img", title: "Parallel (join)"
  element :end_of_process, "img", title: "End of process"
  element :starting_task, "img", title: "Starting Task"

  element :process_table, "#ext-gen20"
end

class Home < SitePrism::Page
  # Variables
  set_url  $url_home
  section :main_menu, Main_Menu_section, "#pm_menu"
  section :header_section, Header_section, "#pm_header"
  iframe :designer_iframe, Designer_iframe, "#frameMain"

  # Methods
  def go_to_menu (menu)
    @menu = find('a', :text => /^#{menu}$/, :match => :first)
    raise "FAILED: Menu (#{menu}) not visible." if !@menu.visible?
    @menu.click

    if menu == "Process"
      designer_iframe do |iframe|
        iframe.wait_for_new_process_button(5)
        iframe.wait_until_new_process_button_visible(5)
        expect(iframe.has_new_process_button?).to eq(true)
        expect(iframe.has_edit_process_button?).to eq(true)
      end
    end
  end

  def fill_field (field, value)
    field.set value
  end

  def open_dialog (element)
    if element == "Process"
      designer_iframe do |designer_frame|
        designer_frame.new_process_button.click
        # Close Dialog
        #designer_frame.new_process_dialog.close_dialog_icon.click
      end
    end
    if element == "DynaForms"
      designer_iframe do |designer_frame|
        designer_frame.process_submenu.dynaforms.click
        # Close Dialog
        #designer_frame.new_process_dialog.close_dialog_icon.click
      end
    end
  end
end