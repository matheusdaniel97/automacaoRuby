describe "Login com Cadastro", :Login3 do
  before(:each) do
    visit "/access"
  end

  after(:each) do
    sleep 2
  end

  it "logando" do
    within("#login") do #Dentro do elemento pai "#login" pesquise:
      find("input[name=username]").set "stark" #Elemento filho username
      find("input[name=password]").set "jarvis!" #Elemento filho password
      click_button "Entrar"
    end

    expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!" #Esperado que o texto do #flash contém " Olá, Tony..."
  end

  it "Criando conta" do
    within("#signup") do #Dentro do elemento pai "#signup" pesquise:
      find("input[name=username]").set "stark"  #Elemento filho username
      find("input[name=password]").set "jarvis!"  #Elemento filho password
      click_link "Criar Conta"
    end

    expect(page).to have_content "Dados enviados. Aguarde aprovação do seu cadastro!" #Esperado que o texto do #flash contém "Dados enviados..."
  end
end
