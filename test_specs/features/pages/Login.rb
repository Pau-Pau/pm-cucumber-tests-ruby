class Login < SitePrism::Page
  # Variables
  set_url $url_login

  element :username_field, "input[id='form[USR_USERNAME]']"
  element :password_field, "input[id='form[USR_PASSWORD]']"
  element :workspace_field, "input[id='form[USER_ENV]']"
  element :language_dd, "select[id='form[USER_LANG]']"
  element :login_button, "input[id='form[BSUBMIT]']"
  element :colosa_page, "a", text: "Colosa, Inc."

  # Methods
  def authenticate(user, psw, lang)
    username_field.set user
    password_field.set psw
    language_dd.set lang
    login_button.click
  end
end
