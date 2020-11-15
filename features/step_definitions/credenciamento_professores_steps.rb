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

Dado "que existam as seguintes solicitações:" do |table|
    User.destroy_all
    table.hashes.each do |row|
        name = row['user_full_name']
        user = User.create!(full_name: name, email: name+'@professor.com', password: name+'123', role: 'professor', registration: '200000000')
        SeiProcess.create!(user_id: user.id, status: row['status'], code: 0)
    end
end

Dado "que existam os seguintes credenciamentos sem prazo definido:" do |table|
    User.destroy_all
    table.hashes.each do |row|
        name = row['user_full_name']
        user = User.create!(full_name: name, email: name+'@professor.com', password: name+'123', role: 'professor', registration: '200000000')
        sei_process = SeiProcess.create!(user_id: user.id, status: 'Aprovado', code: 0)
        Accreditation.create!(user_id: user.id, sei_process_id: sei_process.id, start_date: row['start_date'])
    end
end

Dado /^que eu esteja cadastrado e logado como (.*)$/ do |input|
    user_props = [:full_name, :email, :password, :role, :registration]
    
    values = input.gsub!(/"/,'').split(/,\s?/)
    record = Hash[user_props.zip(values)]
    User.create!(record)
    
    steps %(
        Dado que eu esteja logado como "#{record[:email]}", "#{record[:password]}"
    )
end

Dado /^que eu esteja logado como (.*)$/ do |input|
    fields = ['email', 'password']
    values = Hash[fields.zip input.gsub!(/"/,'').split(/,\s?/)]

    visit new_user_session_path
    fill_in("Email", :with => values['email'])
    fill_in("Password", :with => values['password'])
    click_button("Log in")
end

Dado /^que eu esteja na página (.+)$/ do |page_name|
    visit path_to(page_name)
end

Quando /^eu escolho (avaliar|definir o prazo de) "([^"]*)"$/ do |state, name|
    user_id = User.find_by(full_name: name).id
    if state = 'avaliar'
        process_id = SeiProcess.find_by(user_id: user_id).id
        visit "/sei_processes/#{process_id}/edit"
    elsif state = 'definir o prazo de'
        accreditation_id = Accreditation.find_by(user_id: user_id).id
        visit "/accreditations/#{accreditation_id}/edit"
    end
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

Quando /^eu seleciono uma data posterior a atual em '([^']*)'$/ do |field|
    pending
    # select_date(date, :from => field)
end

Quando /^eu seleciono uma data anterior a atual em '([^']*)'$/ do |field|
    pending
    # select_date(date, :from => field)
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
    if(status == 'sucesso') 
        find(".notice", text: /sucesso!$/)
    elsif(status == 'erro')
        find("#error_explanation")
    else
        raise StandardError.new('Mensagem não encontrada')
    end
end
