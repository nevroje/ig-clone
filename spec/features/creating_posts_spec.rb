require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/coffee.jpg")
    fill_in 'Caption', with: '#coffeetime'
    click_button 'Create Post'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
  end

  it 'needs an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: "No picture"
    click_button 'Create Post'
    expect(page).to have_content("Stop right there! You need an image to post here!")
  end
end