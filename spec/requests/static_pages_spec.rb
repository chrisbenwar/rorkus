require 'spec_helper'

describe "Static Pages" do
	
  describe "Home Page" do

    it "should have the content 'Rorkus'" do
	    visit '/static_pages/home'
	    page.should have_selector('h1', :text => 'Rorkus')
    end

    it "should have the right title" do
        visit '/static_pages/home'
        page.should have_selector('title',
            :text => "Rorkus - Ruby on Rails kus you kan | Home")
    end

    it "should have the content 'Help'" do
	    visit '/static_pages/help'
	    page.should have_selector('h1', :text => 'Help')
    end

    it "should have the right title" do
        visit '/static_pages/help'
        page.should have_selector('title',
            :text => "Rorkus - Ruby on Rails kus you kan | Help")
    end

    it "should have the content 'About Rorkus'" do
	    visit '/static_pages/about'
	    page.should have_selector('h1', :text => 'About Rorkus')
    end

    it "should have the right title" do
        visit '/static_pages/about'
        page.should have_selector('title',
            :text => "Rorkus - Ruby on Rails kus you kan | About")
    end

  end
end
