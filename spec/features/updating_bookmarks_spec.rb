feature 'Updating a bookmark' do
  scenario 'A user can update a bookmark' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    first('.bookmark').click_button 'Update'

    fill_in('url', with: 'http://www.testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')
    expect(current_path).to eq '/bookmarks'
    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end
end
