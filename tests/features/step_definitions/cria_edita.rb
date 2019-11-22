Dado("que eu tenho novas informações") do |table|
    @titulo = table.rows_hash['titulo'] # titulo recebe o titulo criado no caso -> Usuario nao consegue conectar ...
    @conteudo = table.rows_hash['conteudo']
    visit('http://k8s.homolog.professor.appprova.com.br/')
  end
  
  Quando("eu insiro esses dados") do
    
  end
  
  Entao("verifico se ocorreu inserção desses dados no banco.") do
    
  end