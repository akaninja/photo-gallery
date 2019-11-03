require 'rails_helper'

feature 'User visits home' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css('h1', text: 'Galeria de fotos')
  end
end
