describe "Teclado", :Key do
  before(:each) do
    visit "/key_presses"
  end

  it "simulando as teclas simbolos" do
    teclas = %i[tab escape space enter shift control alt] #Guarde em array [Essas teclas]

    teclas.each do |t| #Para cada tecla do array, faça:
      find("#campo-id").send_keys t #No campo-id tecle
      expect(page).to have_content t.to_s.upcase #Esperado que na página contenha aquela tecla(Considerando a tecla em maiusculo)
      sleep 1 #Sleep para ver o resultado sendo impresso na tela (Meramente ilustrativo)
    end
  end

  it "enviando letras" do
    letras = %w[a s d f g h j k l] #Guarde em array [Essas teclas]

    letras.each do |l| #Para cada tecla do array, faça:
      find("#campo-id").send_keys l #No campo-id tecle
      expect(page).to have_content l.to_s.upcase #Esperado que na página contenha aquela tecla(Considerando a tecla em maiusculo)
      sleep 1 #Sleep para ver o resultado sendo impresso na tela (Meramente ilustrativo)
    end
  end
end
