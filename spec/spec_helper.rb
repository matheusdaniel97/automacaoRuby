require "capybara"
require "capybara/rspec"
require "selenium-webdriver"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include Capybara::DSL #Até aqui é configuração padrão de todo projeto de automação Ruby com Capybara

  config.before(:example) do
    page.current_window.resize_to(1280, 800) #Antes de cada caso de teste ajusta a janela para 1280x800
  end

  config.after(:example) do |e|
    sleep 2 #Apenas para ver o resultado da automação, esse sleep não é necessário e não altera os resultados
    nome = e.description.gsub(/[^A-Za-z0-9 ]/, "").tr(" ", "_") #Expressão regular para tratar o nome do caso de teste para arquivo screenshot
    page.save_screenshot("log/" + nome + ".png") #if e.exception  #Esse if é feito para tirar print somente quando o teste falha (basta descomentar)
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome #Navegador de teste
  config.default_max_wait_time = 5         #Tempo máximo de espera para um elemento HTML ser carregado. Evita sleeps \o/
  config.app_host = "https://training-wheels-protocol.herokuapp.com"  #Site padrão
end
