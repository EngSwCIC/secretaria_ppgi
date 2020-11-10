Dado "que as seguintes solicitações estejam pendentes:" do |table|
    pending
    # table.hashes.each do |row|
    #     Activity.create!(row)
    # end
end

Dado /^que eu estou cadastrado e logado como (.*)$/ do |input|
    user_props = [:full_name, :email, :password, :role, :registration]
    
    values = input.gsub!(/"/,'').split(/,\s?/)
    record = Hash[user_props.zip(values)]
    User.create!(record)
    
    steps %(
        Dado que eu estou logado como "#{record[:email]}", "#{record[:password]}"
    )
end

Dado /^que eu estou logado como (.*)$/ do |input|
    fields = ['email', 'password']
    values = Hash[fields.zip input.gsub!(/"/,'').split(/,\s?/)]

    visit new_user_session_path
    fill_in("Email", :with => values['email'])
    fill_in("Password", :with => values['password'])
    click_button("Log in")
end

Dado /^que eu estou na página (.+)$/ do |page_name|
    visit path_to(page_name)
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

Quando /^eu marco os seguintes estados (.*)$/ do |statuses|
    statuses.split(/,[ ]*/).each do |status|
        check("statuses[#{status}]")
    end
end

Quando /^eu desmarco os seguintes estados (.*)$/ do |statuses|
    statuses.split(/,[ ]*/).each do |status|
        uncheck("statuses[#{status}]")
    end
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
