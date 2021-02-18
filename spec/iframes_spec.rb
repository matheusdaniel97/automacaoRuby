describe "iframe" do
  describe "iframe com name", :iframe_name do
    before(:each) do
      visit "/nice_iframe"
    end

    it "adicionar ao carrinho" do
      within_frame("burgerId") do #Com o iframe BurguerId
        produto = find(".menu-item-info-box", text: "REFRIGERANTE") #Descubra a classe (".menu...") cuja contém texto "Refrigerante"
        produto.find("a").click #Click no link da classe selecionada
        expect(find("#cart")).to have_content "R$ 4,50" #Esperado que na classe cart contenha "R$ 4,50"
      end
    end
  end

  describe "iframe sem name", :iframe_noname do
    before(:each) do
      visit "/bad_iframe"
    end

    it "carrinho deve estar vazio" do
      script = '$(".box-iframe").attr("id", "tempId")' #script JS que insere id no html
      page.execute_script(script) #execute o script

      within_frame("tempId") do #com o iframe tempId
        expect(find("#cart")).to have_content "Seu carrinho está vazio"  #Esperado que na classe cart contenha "Seu carrinho..."
      end
    end
  end
end
