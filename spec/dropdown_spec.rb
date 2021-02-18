describe "Caixa de opções", :dropdown do
  it "item especifico simples" do
    visit "/dropdown"

    #select('Opção', from: 'elemento') opção exclusiva para IDs
    select("Loki", from: "dropdown")
  end

  it "item especifico com o find" do
    visit "/dropdown"
    drop = find(".avenger-list")  #Encontra a lista
    drop.find("option", text: "Scott Lang").select_option #Da lista selecione a opção com texto "Scott lang"
  end

  it "qualquer item", :sample do
    visit "/dropdown"
    drop = find(".avenger-list")  #Encontra a lista
    drop.all("option").sample.select_option #Da lista selecione qualquer opção
  end
end
