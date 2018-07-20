module LoginSupport
  def sign_in_as(user)
    visit root_path
    click_link 'Inicia sesión'
    fill_in 'user_login', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Iniciar sesión'
  end
end
