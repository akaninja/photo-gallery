require 'rails_helper'

feature 'User views his albums list' do
  scenario 'successfully' do
    Album.create!(title: 'Hepdogs')
    Album.create!(title: 'Hepcats')

    visit root_path
    click_on 'Meus álbuns'

    expect(page).to have_content('Hepdogs')
    expect(page).to have_content('Hepcats')
  end

  scenario 'and views especific album' do

    album = Album.create!(title: 'Hepdogs')
    album.photos.attach(io: File.open(Rails.root
         .join('spec', 'support', 'hepcats.jpg')), filename: 'hepcats.jpg')
    Album.create!(title: 'Hepcats')

    visit root_path
    click_on 'Meus álbuns'
    click_on 'Hepdogs'

    expect(page).to have_content('Hepdogs')
    expect(page).to have_css('img[src*="hepcats.jpg"]')
  end
end
