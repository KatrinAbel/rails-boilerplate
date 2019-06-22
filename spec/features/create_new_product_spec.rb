require 'rails_helper.rb'

describe 'Managing products', type: :feature do
  let(:user) {FactoryBot.create(:user)}
  let(:user2) {FactoryBot.create(:user, email: 'testfail@test.com', password: 'failfail')}

  before(:each) do
    sign_in(user)
    # user1_create_new_product?
  end

  it 'loads the page' do
    visit '/products'
    expect(page).to have_content('Products')
  end

  it 'display products associated with user' do
    product = FactoryBot.create(:product, user: user)
    visit '/products'
    expect(page).to have_content(product[:title])
  end

  it 'do not display products created by a different user' do
    product2 = FactoryBot.create(:product, title: 'Lama', user: user2)
    visit '/products'
    expect(page).to have_no_content(product2[:title])
  end

  it 'allows to create new products' do
    create_new_product
    expect(page).to have_content('Hola')
  end

  private

  def create_new_product
    visit '/products'
    click_link 'New'
    fill_in 'Title', with: 'Hola'
    fill_in 'Description', with: 'Not my problama'
    fill_in 'Price', with: '1.0'
    click_button 'Create Product'
  end

end
