require 'uri'
#require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /exists a source on the database/ do
    Source.create!(title: 'test_source')
end

Given /(?:|I'm) on the "(.+)" page$/ do |page_name|
    visit path_to(page_name)
end

Given /(?:|I'm) an (.+)$/ do |user_type|
    case user_type
    when "administrator"
        steps %(
            When I fill the login form with:
                | Email | gabriel_nrf@hotmail.com |
                | Senha | qwerty                  |
            And I click the Login button" 
        )
    when "secretary"
        steps %(
            When I fill the login form with:
                | Email | zezinho@hotmail.com |
                | Senha | qwerty                  |
            And I click the Login button" 
        )
    when "professor"
        steps %(
            When I fill the login form with:
                | Email | fulaninho@hotmail.com |
                | Senha | qwerty                  |
            And I click the Login button" 
        )
    when "student"
        steps %(
            When I fill the login form with:
                | Email | ciclaninho@hotmail.com |
                | Senha | qwerty                  |
            And I click the Login button" 
        )
    end
end

When /I click on the "(.+)" button$/ do |button|
    click_button(button)
end

When /I click on the "(.+)" link$/ do |link|
    click_link(link)
end

When /I fill the form with "([^"]*)"$/ do |table|
    table.rows_hash.each {|field , value| fill_in field, :with => value}
end

Then /I should be in the "(.+)" page$/ do |page_name|
    current_path = URI.parse(current_url).path

    if current_path.respond_to? :should
        current_path.should == path_to(page_name)        
    else
        assert_equal current_path == path_to(page_name)
    end
end

Then /I should see "(.+)"/ do |object|

    if page.respond_to? :should
        page.should have_content(object)
    else
        assert page.has_content(object)
    end
end

Then /I should not see "(.+)"/ do |object|

    if page.respond_to? :should
        page.should have_no_content(object)
    else
        assert page.has_no_content(object)
    end
end