require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
    def with_scope(locator)
        locator ? within(*selector_for(locator)) { yield } : yield
    end
end
World(WithinHelpers)

module UserSessionHelper
    def current_user
        @current_user
    end
  
    def login user
        @current_user = user
        visit new_user_session_path
        fill_in("Email", with: user.email)
        fill_in("Password", with: user.password)
        click_button("Log in")
        Current.user = @current_user
    end
    
    def sower_begin (user=nil)
        if user != nil
            @saved_user = user
            visit '/'
            click_link("Sair")
        end
  
        sower = User.create(
            full_name: "Sower",
            email: "sower@admin.com",
            password: "admin123",
            role: "administrator",
            registration: "000000000"
        )
        login(sower)
    end
  
    def sower_finish
        Current.user = nil
        visit '/'
        click_link("Sair")
        @current_user = nil

        login(@saved_user) if @saved_user != nil
    end
end
World(UserSessionHelper) if respond_to?(:World)

Dado "que existam as seguintes solicitações:" do |table|
    sower_begin
    file = fixture_file_upload(Rails.root.join('public', 'TestImage.png'), 'image/png')
    
    table.hashes.each do |row|
        name = row['user_full_name']
        user = User.create!(
            full_name: name,
            email: name+'@professor.com',
            password: name+'123',
            role: 'professor',
            registration: '200000000'
        )
        SeiProcess.create!(
            user_id: user.id,
            status: row['status'],
            code: 0,
            documents: [file]
        )
    end
    sower_finish
end

Dado "que existam os seguintes credenciamentos sem prazo definido:" do |table|
    sower_begin
    file = fixture_file_upload(Rails.root.join('public', 'TestImage.png'), 'image/png')
    
    table.hashes.each do |row|
        name = row['user_full_name']
        user = User.create!(
            full_name: name,
            email: name+'@professor.com',
            password: name+'123',
            role: 'professor',
            registration: '200000000'
        )
        sei_process = SeiProcess.create!(
            user_id: user.id,
            status: 'Aprovado',
            code: 0,
            documents: [file]
        )
        Accreditation.create!(
            user_id: user.id,
            sei_process_id: sei_process.id,
            start_date: row['start_date']
        )
    end
    sower_finish
end

Dado /^que eu esteja cadastrado e logado como (.*)$/ do |input|
    user_props = [:full_name, :email, :password, :role, :registration]
    
    values = input.gsub!(/"/,'').split(/,\s?/)
    record = Hash[user_props.zip(values)]
    user = User.create!(record)
    login(user)
end

Dado /^que eu esteja na página (.+)$/ do |page_name|
    visit path_to(page_name)
end

Quando /^eu escolho avaliar "([^"]*)"$/ do |name|
    user_id = User.find_by(full_name: name).id
    process_id = SeiProcess.find_by(user_id: user_id).id
    visit "/sei_processes/#{process_id}/edit"
end

Quando /^eu escolho credenciar "([^"]*)"$/ do |name|
    user_id = User.find_by(full_name: name).id
    accreditation_id = Accreditation.find_by(user_id: user_id).id
    visit "/accreditations/#{accreditation_id}/edit"
end

Quando /^eu anexo o arquivo "([^"]*)" em '([^']*)'$/ do |path, field|
    attach_file(field, File.expand_path(path))
end

Quando /^eu clico em '([^']*)'$/ do |link|
    click_link(link)
end

Então /^eu devo estar na página (.+)$/ do |page_name|
    current_path = URI.parse(current_url).path
    if current_path.respond_to? :should
        current_path.should == path_to(page_name)
    else
        assert_equal path_to(page_name), current_path
    end
end

Quando /^eu escolho '([^']*)'$/ do |option|
    choose(option)
end

Quando /^eu marco os seguintes estados: (.*)$/ do |statuses|
    statuses.split(/,[ ]*/).each do |status|
        check("statuses[#{status}]")
    end
end

Quando /^eu desmarco os seguintes estados: (.*)$/ do |statuses|
    statuses.split(/,[ ]*/).each do |status|
        uncheck("statuses[#{status}]")
    end
end

Quando /^eu preencho em '([^']*)' com/m do |field, text|
    fill_in(field, :with => text)
end

Quando /^eu preencho com "([^"]*)" em '([^']*)'$/ do |text, field|
    fill_in(field, :with => text)
end

Quando /^eu seleciono uma data final (posterior|anterior) a data inicial$/ do |status|
    if status == 'posterior'
        season = 5
    elsif status == 'anterior'
        season = -5
    end
    date1 = (Date.current+season).strftime("%Y-%m-%e")
    date2 = (Date.current).strftime("%Y-%m-%e")
    fill_in 'Data final', with: date1
    fill_in 'Data inicial', with: date2
end

Quando /^eu aperto '([^']*)'$/ do |button|
    click_button(button)
end

Então /^eu devo ver "([^"]*)"$/ do |text|
    if page.respond_to? :should
        page.should have_content(text)
    else
        assert page.has_content?(text)
    end
end

Então /^eu não devo ver "([^"]*)"$/ do |text|
    if page.respond_to? :should
        page.should have_no_content(text)
    else
        assert page.has_no_content?(text)
    end
end

Então /^eu devo receber uma mensagem de (sucesso|erro)$/ do |status|
    if status == 'sucesso'
        find(".notice", text: /sucesso!$/)
    elsif status == 'erro'
        find("#error_explanation")
    else
        raise StandardError.new('Mensagem não encontrada')
    end
end
