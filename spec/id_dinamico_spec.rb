describe "Ids Dinamicos", :IdDinamico do
  before(:each) do
    visit "/access"
  end

  it "cadastro" do
    find("input[id$=UsernameInput]").set "Matheus" #$ = Termina com ...
    find("input[id^=PasswordInput]").set "123456"  #^ = Começa com ...
    find("a[id*=GetStartedButton]").click          #* = Contém ...

    expect(page).to have_content "Dados enviados. Aguarde aprovação do seu cadastro!"
  end
end
