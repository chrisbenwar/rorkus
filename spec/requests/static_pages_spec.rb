require 'spec_helper'

describe "Static Pages" do
	
  let(:base_title) { "Rorkus - Ruby on Rails kus you kan" }

  describe "Home Page" do

    it "should have the content 'Rorkus'" do
	    visit '/static_pages/home'
	    page.should have_selector('h1', :text => 'Rorkus')
    end

    it "should have the right title" do
        visit '/static_pages/home'
        page.should have_selector('title',
            :text => "#{base_title} | Home")
    end

    it "should have the content 'Help'" do
	    visit '/static_pages/help'
	    page.should have_selector('h1', :text => 'Help')
    end

    it "should have the right title" do
        visit '/static_pages/help'
        page.should have_selector('title',
            :text => "#{base_title} | Help")
    end

    it "should have the content 'About Rorkus'" do
	    visit '/static_pages/about'
	    page.should have_selector('h1', :text => 'About Rorkus')
    end

    it "should have the right title" do
        visit '/static_pages/about'
        page.should have_selector('title',
            :text => "#{base_title} | About")
    end

  end
end
