require 'spec_helper'

describe "User pages" do
  let(:base_title) { "Rorkus - Ruby on Rails kus you kan" }

  subject { page }

  describe "signup page" do

    before { visit signup_path }
    let(:submit) { "Create my account" }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: "#{base_title} | Sign up") }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
      describe "after submission" do
        before { click_button submit }

        it { should have_selector('title', text: 'Sign up') }
        it { should have_content('error') }
      end
    end

    describe "with valid info" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        it { should have_link('Sign out') }
      end
    end
    
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) } 

    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_selector('title', text: "#{base_title} | #{user.name}") }
  end
end
