describe "Login", :Login do
  it "login com sucesso" do
    visit "/login"

    fill_in "userId", with: "stark" #Preencha no "userId" com "stark"
    fill_in "password", with: "jarvis!" #Preencha no "password" com "jarvis!"

    click_button "Login" #Clicar no botão login

    expect(find("#flash").visible?).to be true #Esperado que o #flash está visivel

    expect(find("#flash").text).to include "Olá, Tony Stark. Você acessou a área logada!" #Esperado que o texto do #flash inclui "Tony..."

    expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!" #Esperado que o texto do #flash contém "Tony..."
  end

  it "senha incorreta" do
    visit "/login"

    fill_in "userId", with: "stark" #Preencha no "userId" com "stark"
    fill_in "password", with: "jarvisssss!" #Preencha no "password" com "jarvisssss!"

    click_button "Login"  #Clicar no botão login

    expect(find("#flash")).to have_content "Senha é invalida!"  #Esperado que o texto do #flash contém "Senha..."
  end

  it "usuário não cadastrado" do
    visit "/login"

    fill_in "username", with: "WrongUser" #Preencha no "userId" com "WrongUser"
    fill_in "password", with: "jarvis!" #Preencha no "password" com "jarvis!"

    click_button "Login" #Clicar no botão login

    expect(find("#flash")).to have_content "O usuário informado não está cadastrado!" #Esperado que o texto do #flash contém "O usuário..."
  end
end
