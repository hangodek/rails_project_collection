require "application_system_test_case"

class TodolistsTest < ApplicationSystemTestCase
  setup do
    @todolist = todolists(:one)
  end

  test "visiting the index" do
    visit todolists_url
    assert_selector "h1", text: "Todolists"
  end

  test "should create todolist" do
    visit todolists_url
    click_on "New todolist"

    fill_in "Deadline date", with: @todolist.deadline_date
    fill_in "Description", with: @todolist.description
    check "Status" if @todolist.status
    fill_in "Title", with: @todolist.title
    click_on "Create Todolist"

    assert_text "Todolist was successfully created"
    click_on "Back"
  end

  test "should update Todolist" do
    visit todolist_url(@todolist)
    click_on "Edit this todolist", match: :first

    fill_in "Deadline date", with: @todolist.deadline_date
    fill_in "Description", with: @todolist.description
    check "Status" if @todolist.status
    fill_in "Title", with: @todolist.title
    click_on "Update Todolist"

    assert_text "Todolist was successfully updated"
    click_on "Back"
  end

  test "should destroy Todolist" do
    visit todolist_url(@todolist)
    click_on "Destroy this todolist", match: :first

    assert_text "Todolist was successfully destroyed"
  end
end
