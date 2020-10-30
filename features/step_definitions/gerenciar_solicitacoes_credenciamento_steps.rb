Dado "que os seguintes solicitações estejam pendentes:" do |table|
    pending
#    table.hashes.each do |row|
#        Activity.create!(row)
#    end
end

Dado /^que eu estou cadastrado como (.*)$/ do |values|
    pending
#    values.split(/,[ ]*/).each do |value|
#    end
end

Dado /^que eu estou logado como (.*)$/ do |values|
    pending
#    values.split(/,[]*/)
#    fill_in("Email", :with => values[0])
#    fill_in("Password", :with => values[1])
#    click_button("Log in")
end

Quando /^eu clico em "([^"]*)"$/ do |link|
    pending
#    click_link(link)
end

Então /^eu devo ver "([^"]*)"$/ do |text|
    pending
#    if page.respond_to? :should
#        page.should have_content(text)
#    else
#        assert page.has_content?(text)
#    end
end

Então /^eu não devo ver "([^"]*)"$/ do |text|
    pending
#    if page.respond_to? :should
#        page.should have_no_content(text)
#    else
#        assert page.has_no_content?(text)
#    end
end

Dado /^que estou na página de (.+)$/ do |page_name|
    visit path_to(page_name)
end

Então /^eu devo estar na página (.+)$/
    pending
end
