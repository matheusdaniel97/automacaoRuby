describe "Login2", :Login2 do
  before(:each) do
    visit "/login2"
  end

  it "logando" do
    fill_in "userId", with: "stark" #Preencha no "userId" com "stark"
    fill_in "passId", with: "jarvis!" #Preencha no "password" com "jarvisssss!"

    login_form = find("#login") #Descubra o formulário de login

    case login_form.text #Caso o formulário contenha o campo com texto:
    when /Dia/
      find("#day").set "29" #Preencher com 29
    when /Mês/
      find("#month").set "05"
    when /Ano/
      find("#year").set "1970"
    end

    click_button "Login"
    expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!" #Esperado que o texto do #flash contém "Tony..."
  end
end
