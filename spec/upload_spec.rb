describe "Upload", :Upload, :smoke do
  before(:each) do
    visit "/upload"

    #Criando arquivos
    @arquivo = Dir.pwd + "/spec/fixtures/arquivo.txt"
    @imagem = Dir.pwd + "/spec/fixtures/imagem.png"
  end

  it "upload com arquivo texto" do
    attach_file("file-upload", @arquivo) #Anexe o arquivo no "file-upload", sendo o arquivo "@arquivo"
    click_button "Upload"

    div_arquivo = find("#uploaded-file")  #Descubra a div_arquivo no "#uploaded-file"
    expect(div_arquivo.text).to eql "arquivo.txt" #Esperado que o texto da div_arquivo seja igual "arquivo.txt"(nome do arquivo)
  end

  it "upload de imagem" do
    attach_file("file-upload", @imagem) #Anexe a imagem no "file-upload", sendo a imagem "@imagem"
    click_button "Upload"

    img = find("#new-image")  #Descubra a img no "#new-image"
    expect(img[:src]).to include "imagem.png" #Esperado que o src da imagem inclua o "imagem.png"(Título da imagem)
  end
end
