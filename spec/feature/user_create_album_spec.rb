require 'rails_helper'

feature 'User creates photo album' do
  scenario 'succesfully' do
    visit root_path
    click_on 'Novo album'
    fill_in 'Título', with: "Hepcat's Fever"
    attach_file 'Fotos', Rails.root.join('spec', 'support', 'hepcats.jpg')
    fill_in 'Marcadores', with: 'Festival'
    click_on 'Enviar'

    expect(page).to have_content("Hepcat's Fever")
    expect(page).to have_css('img[src*="hepcats.jpg"]')
  end

  scenario 'and must have title' do
    visit root_path
    click_on 'Novo album'
    fill_in 'Título', with: ''
    fill_in 'Marcadores', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Título não pode ficar em branco')
  end
end

