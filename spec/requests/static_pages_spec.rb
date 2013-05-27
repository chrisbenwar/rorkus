require 'spec_helper'

describe "Static Pages" do
  subject { page }
	
  let(:base_title) { "Rorkus - Ruby on Rails kus you kan" }

  describe "Home Page" do
    before { visit root_path }
    it { should have_selector('h1', text: "Rorkus") }
    it { should have_selector('title', text: "#{base_title}")}
  end

  describe "Help Page" do
    before { visit help_path }
	  it { should have_selector('h1', text: 'Help') }
    it { should have_selector('title', text: "#{base_title} | Help") }
  end

  describe "About Page" do
    before { visit about_path }
	  it { should have_selector('h1', text: 'About Rorkus') }
    it { should have_selector('title', text: "#{base_title} | About") }
  end

  describe "Contact page" do
    before { visit contact_path }
    it { should have_selector('h1', text: 'Contact') }
    it { should have_selector('title', text: "#{base_title} | Contact") }
  end
end
