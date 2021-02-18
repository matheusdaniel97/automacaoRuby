describe "Tabela", :tabela, :smoke do
  before(:each) do
    visit "/tables"
  end

  it "deve exibir o salario do stark" do
    atores = all("table tbody tr")                                          #Seleciona todos os atores da tabela
    stark = atores.detect { |ator| ator.text.include?("Robert Downey Jr") } #Detecta o ator que inclui o texto 'Robert Downey Jr'

    expect(stark.text).to include "10.000.000"                              #Verifica se o ator detectado contém um campo com 10.000.000
  end

  it "deve exibir o salario do vin diesel" do
    diesel = find("table tbody tr", text: "@vindiesel") #Seleciona a tabela e a linha cuja o texto há '@vindiesel'

    expect(diesel).to have_content "10.000.000"         #Verifica se a linha selecionada tem campo com 10.000.000
  end

  it "deve exibir o filme velozes" do
    diesel = find("table tbody tr", text: "@vindiesel") #Seleciona a tabela e a linha cuja o texto há '@vindiesel'
    movie = diesel.all("td")[2].text                    #Seleciona a coluna 2 da linha selecionada acima

    expect(movie).to eql "Velozes e Furiosos"           #Verifica se na coluna e linha selecionada é igual a "Velozes e Furiosos" (OBS. Verifica exatamente naquela linha E Coluna)
  end

  it "deve exibir o insta do Chris Evans" do
    evans = find("table tbody tr", text: "Chris Evans") #Seleciona a tabela e a linha cuja o texto há 'Chris Evans'
    insta = evans.all("td")[4].text                     #Seleciona a coluna 4 da linha selecionada acima

    expect(insta).to eql "@teamcevans"                  #Verifica se na coluna e linha selecionada é igual a "@teamcevans" (OBS. Verifica exatamente naquela linha E Coluna)
  end

  it "deve selecionar Chris Prat para remover" do
    prat = find("table tbody tr", text: "Chris Prat")               #Seleciona a tabela e a linha cuja o texto há 'Chris Prat'
    prat.find("a", text: "delete").click                            #Seleciona o link 'a' onde contém o texto 'delete' e Clica

    msg = page.driver.browser.switch_to.alert.text                  #Seleciona a mensagem do alerta
    expect(msg).to eql "Chris Pratt foi selecionado para remoção!"  #Verifica se a mensagem selecionada é igual a "Chris Pratt foi... remoção"
    page.driver.browser.switch_to.alert.accept
  end

  it "deve selecionar Chris Prat para editar" do
    prat = find("table tbody tr", text: "Chris Prat")                #Seleciona a tabela e a linha cuja o texto há 'Chris Prat'
    prat.find("a", text: "edit").click                               #Seleciona o link 'a' onde contém o texto 'edit' e Clica

    msg = page.driver.browser.switch_to.alert.text                   #Seleciona a mensagem do alerta
    expect(msg).to eql "Chris Pratt foi selecionado para edição!"    #Verifica se a mensagem selecionada é igual a "Chris Pratt foi... edição"
    page.driver.browser.switch_to.alert.accept
  end
end
