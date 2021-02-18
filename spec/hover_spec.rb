describe "Mouse hover", :Hovers do
  before(:each) do
    visit "/hovers"
  end

  it "quando passo o mouse sobre o blade" do
    card = find("img[alt*=lad]") #Descubra uma imagem cujo alt CONTÉM "lad"
    card.hover #Deixar o mouse na imagem descoberta

    expect(page).to have_content "Nome: Blade"
  end

  it "quando passo o mouse sobre o pantera negra" do
    card = find("img[alt^=Pantera]") #Descubra uma imagem cujo alt COMEÇA com "Pantera"
    card.hover #Deixar o mouse na imagem descoberta

    expect(page).to have_content "Nome: Pantera Negra"
  end

  it "quando passo o mouse sobre o homem aranha" do
    card = find('img[alt$="Aranha"]') #Descubra uma imagem cujo alt TERMINA com "Aranha"
    card.hover #Deixar o mouse na imagem descoberta

    expect(page).to have_content "Nome: Homem Aranha"
  end
end
