Dado /^que eu estou cadastrado e logado como (.*)$/ do |input|
    columns = [:full_name, :email, :password, :role, :registration]
    
    values = input.split(/,\s?/)
    values.each_with_index do |value, i|
        if /"([^"]*)"/ === value
            value.gsub!(/"/,'')
        else
            values[i] = value.to_i
        end
    end
    
    record = Hash[columns.zip(values)]
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

Dado "que os seguintes solicitações estejam pendentes:" do |table|
    pending
    # table.hashes.each do |row|
    #     Activity.create!(row)
    # end
end

Quando /^eu clico em "([^"]*)"$/ do |link|
    click_link(link)
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

Dado /^que estou na página (.+)$/ do |page_name|
    visit path_to(page_name)
end

Então /^eu devo estar na página (.+)$/ do |page_name|
    current_path = URI.parse(current_url).path
    if current_path.respond_to? :should
        current_path.should == path_to(page_name)
    else
        assert_equal path_to(page_name), current_path
    end
end
