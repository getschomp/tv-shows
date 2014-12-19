require 'rails_helper'

feature 'user adds characters to a tv show', %Q{"As a site visitor
  I want to add my favorite TV show characters
  So that other people can enjoy their crazy antics"} do
   # Acceptance Criteria:
   # * I can access a form to add a character on a TV show's page
   # * I must specify the character's name and the actor's name
   # * I can optionally provide a description
   # * If I do not provide the required information, I receive an error message
   #   * If the character already exists in the database, I receive an error message

  scenario 'user adds a character with a description' do
    attrs = {
      character_name: 'Tyrion',
      actor_name: 'Peter Dinklage',
      description: 'A mind needs books like a sword needs a wet stone',
      television_show_id: 1
    }

    character = Character.new(attrs)
    visit '/television_shows/1'
    click_on "Add a Character"
    fill_in 'Character Name', with: character.name
    fill_in 'Actor Name', with: actor.name
    click_on 'Submit'
    expect(page).to have_content 'Success'
    expect(page).to_not have_content "has already been taken"
  end

  scenario 'user adds a character without a description' do
    attrs = {
      character_name: 'Ygritte',
      actor_name: 'Rose Leslie',
      television_show_id: 1
    }

    character = Character.new(attrs)
    visit '/television_shows/1'
    click_on "Add a Character"
    fill_in 'Character Name', with: character.name
    fill_in 'Actor Name', with: actor.name
    click_on 'Submit'
    expect(page).to have_content 'Success'
    expect(page).to_not have_content "has already been taken"

  end


  scenario 'without required attributes' do
    visit '/television_shows/1'
    click_on "Add a Character"
    click_on 'Submit'
    expect(page).to_not have_content 'Success'
    expect(page).to have_content "can't be blank"
  end


  scenario 'user cannot add a character that is already in the database' do
    attrs = {
      character_name: 'Tyrion',
      actor_name: 'Peter Dinklage',
      description: 'A mind needs books like a sword needs a wet stone',
      television_show_id: 1
    }

    character = Character.new(attrs)
    visit '/television_shows/1'
    click_on "Add a Character"
    fill_in 'Character Name', with: character.name
    fill_in 'Actor Name', with: actor.name
    click_on 'Submit'
    expect(page).to_not have_content 'Success'
    expect(page).to have_content "has already been taken"
  end
end
