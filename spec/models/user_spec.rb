require 'spec_helper'

describe User do
  before { @user = User.new(name: "Mr. Example", email: "a@example.com") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "name not given" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "name too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "email not given" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email invalid" do
    it "should be invalid" do
      addresses = %w[ user@foo,com user_at_foo.org example.user@foo ] 
      addresses.each do |addr|
        @user.email = addr
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |addr|
        @user.email = addr
        expect(@user).to be_valid
      end
    end
  end

  describe "email taken" do
    before do
      u = @user.dup
      u.save
    end

    it { should_not be_valid }
  end
end
