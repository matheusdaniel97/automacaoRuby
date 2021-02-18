describe "Alertjs", :Alertjs do
  before(:each) do
    visit "/javascript_alerts"
  end

  it "testando alert" do
    click_button "Alerta"

    msg = page.driver.browser.switch_to.alert.text #Redirecione o teste para o alertJs
    expect(msg).to eql "Isto é uma mensagem de alerta"
    page.driver.browser.switch_to.alert.accept     #Aceite o alert (o screenshot não é realizado no alert)
  end

  it "confirmar" do
    click_button "Confirma"

    msg = page.driver.browser.switch_to.alert.text #Redirecione o teste para o alertJs
    expect(msg).to eql "E ai confirma?"

    page.driver.browser.switch_to.alert.accept #Aceite o alert (o screenshot não é realizado no alert)
    expect(page).to have_content "Mensagem confirmada"
  end

  it "nao onfirmar" do
    click_button "Confirma"

    msg = page.driver.browser.switch_to.alert.text #Redirecione o teste para o alertJs
    expect(msg).to eql "E ai confirma?"

    page.driver.browser.switch_to.alert.dismiss #Recuse o alert (o screenshot não é realizado no alert)
    expect(page).to have_content "Mensagem não confirmada"
  end

  it "aceitar prompt", :accept_prompt do
    accept_prompt(with: "Matheus") do #Quando o prompt abrir, preencha com 'Matheus'
      click_button "Prompt"           #Clique no prompt para abrir
    end

    expect(page).to have_content "Olá, Matheus"
  end

  it "cancelar prompt", :dismiss_prompt do
    dismiss_prompt do #Quando o prompt abrir, recuse
      click_button "Prompt"           #Clique no prompt para abrir
    end

    expect(page).to have_content "Olá, null"
  end
end
