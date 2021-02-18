describe "Drag and Drop", :Dragdrop do
  before(:each) do
    visit "/drag_and_drop"
  end

  it "homem aranha no time do stark" do
    stark = find(".team-stark .column")
    cap = find(".team-cap .column")

    imagem = find("img[alt$=Aranha]")
    imagem.drag_to stark

    expect(stark).to have_css "img[alt$=Aranha]"
    expect(cap).not_to have_css "img[alt$=Aranha]"
  end
end
