describe "Select2", :Select2 do
  describe("single", :single) do
    before(:each) do
      visit "/apps/select2/single.html"
    end

    it "Seleciona ator por nome" do
      find(".select2-selection--single").click  #Descubra o dropdown da classe ".select2..." e click
      find(".select2-results__option", text: "Adam Sandler").click  #Descubra das opções do dropdown a opção cujo texto seja "Adam Sandler" e click
    end

    it "Busca e clica no ator" do
      find(".select2-selection--single").click  #Descubra o dropdown da classe ".select2..." e click
      find(".select2-search__field").set "Chris Rock" #Descubra o campo de busca e pesquise "Chris Rock"
      find(".select2-results__option").click #Click na única opção (que será Chris Rock por já ter pesquisado)
    end
  end

  describe("multiple", :multiple) do
    before(:each) do
      visit "/apps/select2/multi.html"
    end

    def selecione(ator) #Método selecione que recebe como argumento "ator"
      find(".select2-selection--multiple").click  #Descubra o dropdown da classe ".select2..." e click
      find(".select2-search__field").set ator #Descubra o campo de busca e pesquise ator(o argumento)
      find(".select2-results__option").click  ##Click na única opção (que será o ator por já ter pesquisado)
    end

    it "Seleciona atores" do
      atores = ["Jim Carrey", "Owen Wilson", "Kevin James"] #Criação do array com [ OS ATORES ]

      atores.each do |a| #Para cada ator do array "atores"
        selecione(a) #Metodo selecione com o argumento ator do array
      end
    end
  end
end
