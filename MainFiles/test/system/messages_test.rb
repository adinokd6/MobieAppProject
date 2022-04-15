require "application_system_test_case"

class MessagesTest < ApplicationSystemTestCase
  setup do
    @message = messages(:one)
  end

  test "visiting the index" do
    visit messages_url
    assert_selector "h1", text: "Messages"
  end

  test "creating a Message" do
    visit messages_url
    click_on "New Message"

    fill_in "Date", with: @message.Date
    fill_in "From", with: @message.From
    fill_in "Messageid", with: @message.MessageId
    fill_in "Text", with: @message.Text
    fill_in "To", with: @message.To
    click_on "Create Message"

    assert_text "Message was successfully created"
    click_on "Back"
  end

  test "updating a Message" do
    visit messages_url
    click_on "Edit", match: :first

    fill_in "Date", with: @message.Date
    fill_in "From", with: @message.From
    fill_in "Messageid", with: @message.MessageId
    fill_in "Text", with: @message.Text
    fill_in "To", with: @message.To
    click_on "Update Message"

    assert_text "Message was successfully updated"
    click_on "Back"
  end

  test "destroying a Message" do
    visit messages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Message was successfully destroyed"
  end
end
