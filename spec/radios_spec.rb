describe "Botoes de radio", :radio, :smoke do
  before(:each) do
    visit "/radios"
  end

  it "seleção por ID" do
    choose("cap") #Escolha opção ID
  end

  it "seleção por find e css selector" do
    find("input[value=guardians]").click #Descubra opção input cujo valor seja "guardians" e click
  end
end
