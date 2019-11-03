require 'rails_helper'

feature 'User creates an exclusive photo album' do
  scenario 'succesfully' do
    visit root_path
    click_on 'Novo album'
    fill_in 'Título', with: "Hepcat's Fever"
    choose 'Privado'
    attach_file 'Fotos', Rails.root.join('spec', 'support', 'hepcats.jpg')
    fill_in 'Marcadores', with: 'Festival'
    click_on 'Enviar'

    expect(page).to have_css('h1',  text: "Hepcat's Fever")
    expect(page).to have_css('p', text: 'Privado')
    expect(page).not_to have_content('Compartilhado')
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

