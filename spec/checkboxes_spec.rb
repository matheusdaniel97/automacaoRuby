describe "Caixas de seleção", :checkbox do
  before(:each) do
    visit "/checkboxes"
  end

  it "marcando uma opção" do #Implementação quando ha ID ou Nome
    check("thor")
  end

  it "desmarcando uma opção" do
    uncheck("antman")
  end

  it "marcando com find set true" do #Quando não ha ID ou Nome requer a implementação dessa forma:
    find("input[value=cap]").set(true) #Check
  end

  it "desmarcando com find set false" do
    find("input[value=guardians]").set(false) #Uncheck
  end
end
