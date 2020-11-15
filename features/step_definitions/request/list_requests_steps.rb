Dado /^Eu esteja cadastrado como administrador, com nome: {Name}, email: {Email}, senha: {Password}, cargo: {Role} e registro: {Registration}$/ do |Name, Email, Pasword, Role, Registration|
    @adm = {
    Name: 'Administrador',
    Email: 'admin@admin.com',
    Password: 'admin123',
    Role: "admin",
    Registration: "000000000"
  }
  Admin.create!(@adm)
end

E /^Eu esteja autenticado como administrador $/ do
    @admin = Admin.find_by_email('admin@admin.com')
end

E /^Eu esteja na página inicial $/ do |root_path|
    visit path_to(root_path)
end

E /^Eu clico em ([^"]*)" $/ do |adminPanel_button|
    click_button(adminPanel_button)
end

Então /^Eu devo estar na pagina (.+) $/ do |admin_path|
    current_path = URI.parse(current_path).path
    if current_path.respond_to? :should
        current_path.should == path_to(admin_path)
    else
        assert_equal path_to(admin_path), current_path
    end
end

E /^Eu clico em ([^"]*") $/ do |showRequestsList_button|
    click_button(showRequestsList_button)
end

Então /^Eu devo estar em uma página com uma tabela mostrando os dados ordenados $/ do |requests_path, table|
    data = table.hashes
    current_path = URI.parse(current_path).path
    if current_path.respond_to? :should
        current_path.should == path_to(requests_path)
        on current_path do |pagina|
            data.each { |_k, v| puts v }
        end
    else
        assert_equal path_to(requests_path), current_path
    end
end
