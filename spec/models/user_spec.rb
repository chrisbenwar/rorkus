require 'spec_helper'

describe User do
  before do @user = User.new(
    name: "Mr. Example", 
    email: "a@example.com",
    password: "secret",
    password_confirmation: "secret") 
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password_confirmation) }

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

  describe "when password is not present" do
    before do
      @user = User.new(name: "Example User", email: "user@example.com", 
                       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end  

  describe "when password confirmation is nil" do
    before do
      @user = User.new(name: "Michael Hartl", email: "mhartl@example.com",
                       password: "foobar", password_confirmation: nil)
    end
    it { should_not be_valid }
  end

  it { should respond_to(:authenticate) }

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "auth return" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "pw valid" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "pw invalid" do
      let(:u_invalid) { found_user.authenticate("invalid") }

      it { should_not eq u_invalid }
      specify { expect(u_invalid).to be_false }  
    end

  end
end
