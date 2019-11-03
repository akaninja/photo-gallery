require 'rails_helper'

feature 'User creates an album' do
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
    expect(page).not_to have_content('Público')
    expect(page).to have_css('img[src*="hepcats.jpg"]')
  end

  scenario 'and sets to public' do
    visit root_path
    click_on 'Novo album'
    fill_in 'Título', with: 'Vintage Jazz and Dance'
    choose 'Público'
    attach_file 'Fotos', Rails.root.join('spec', 'support', 'hepcats.jpg')
    fill_in 'Marcadores', with: 'Festa, bar, dança'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Vintage Jazz and Dance')
    expect(page).to have_css('p', text: 'Público')
    expect(page).not_to have_css('p', text: 'Privado')
    expect(page).to have_css('img[src*="hepcats.jpg"]')
  end

  scenario 'and Privado is default sharing option' do
    visit root_path
    click_on 'Novo album'
    fill_in 'Título', with: 'Bando de Régia'
    attach_file 'Fotos', Rails.root.join('spec', 'support', 'hepcats.jpg')
    fill_in 'Marcadores', with: 'Festa, forro, dança'
    click_on 'Enviar'

    expect(page).to have_css('p', text: 'Privado')
    expect(page).not_to have_css('p', text: 'Público')
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

