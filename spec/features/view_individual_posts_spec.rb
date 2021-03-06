require 'rails_helper.rb'

feature 'Can view individual posts' do
  scenario 'Can click to view single post' do
  post = create(:post)
  visit '/'
  find(:xpath, ".//a[@href='/posts/#{post.id}']").click
  expect(page.current_path).to eq(post_path(post))

  end
end