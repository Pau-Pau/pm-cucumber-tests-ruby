class Main_menu_section < SitePrism::Section
  element :home, "#CASES a"
  element :designer, "#PROCESSES a"
  element :dashboards, "#DASHBOARD a"
  element :admin, "#SETUP a"
end

class Header_section < SitePrism::Section
  element :logout_link, "a", text: "Logout"
  element :workflow_link, "u", text: "workflow"
end

class Home < SitePrism::Page
  # Variables
  set_url  $url_login
  section :main_menu, Main_menu_section, "#pm_menu"
  section :header_section, Header_section, ""

  # Methods
  def go_to_menu (menu)
    @menu = find('a', :text => /@#{menu}$/, :match => :first)
    raise "FAILED: Menu (#{menu}) not visible." if !@menu.visible?
    @menu.click
  end

  def fill_field (field, value)
    field.set value
  end
end