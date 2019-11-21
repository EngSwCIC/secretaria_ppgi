require "application_system_test_case"

class ActivitiesTest < ApplicationSystemTestCase
  setup do
    @activity = activities(:one)
  end

  test "visiting the index" do
    visit activities_url
    assert_selector "h1", text: "Activities"
  end

  test "creating a Activitie" do
    visit activities_url
    click_on "New Activitie"

    fill_in "Date", with: @activity.date
    fill_in "Description", with: @activity.description
    fill_in "Title", with: @activity.title
    click_on "Create Activitie"

    assert_text "Activitie was successfully created"
    click_on "Back"
  end

  test "updating a Activitie" do
    visit activities_url
    click_on "Edit", match: :first

    fill_in "Date", with: @activity.date
    fill_in "Description", with: @activity.description
    fill_in "Title", with: @activity.title
    click_on "Update Activitie"

    assert_text "Activitie was successfully updated"
    click_on "Back"
  end

  test "destroying a Activitie" do
    visit activities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Activitie was successfully destroyed"
  end
end
