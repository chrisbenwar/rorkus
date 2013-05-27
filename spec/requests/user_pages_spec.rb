require 'spec_helper'

describe "User pages" do
  let(:base_title) { "Rorkus - Ruby on Rails kus you kan" }

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: "#{base_title} | Sign up") }
  end
end
