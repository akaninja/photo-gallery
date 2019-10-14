require 'rails_helper'

feature 'User views his album list' do
  scenario 'successfully' do
    Album.create!(title: 'Hepdogs')
    Album.create!(title: 'Hepcats')

    visit root_path
    click_on 'Meus álbuns'
    
    expect(page).to have_content('Hepdogs')
    expect(page).to have_content('Hepcats')
  end
end
