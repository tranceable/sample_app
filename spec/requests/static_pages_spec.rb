require 'spec_helper'

describe "Static pages" do

  subject { page }
  #let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading)    { 'About Us' }
    let(:page_title) { 'About' }

    it_should_behave_like "all static pages"
  end

  describe "Contacts" do
    before { visit contacts_path }
    let(:heading)    { 'Contacts' }
    let(:page_title) { 'Contacts' }

    it_should_behave_like "all static pages"
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Contacts"
    expect(page).to have_title(full_title('Contacts'))
    click_link "Home"
    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sign up'))
    click_link "sample app"
    expect(page).to have_title(full_title(''))
  end
end
