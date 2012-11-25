require 'spec_helper'

describe User do
  before { @user = User.new(name: "Example User", email: "user@example.com", password: 'foobar', password_confirmation: 'foobar' }

  subject { @user }

  it { should respond_to :name }
  it { should respond_to :email }
  it { should respond_to :password_digest }
  it { should respond_to :password_confirmation }
  it { should be_valid }

  describe 'when name not present' do
    before { @user.name = '' }
    it { should_not be_valid }
  end

  describe 'name is too long' do
    before { @user.name = 'a'*100 }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end

  describe "missing password" do
    before { @user.password = @user.password_confirmation = '' }
    it { should_not be_valid }
  end

  describe "password doesn't match" do
    before { @user.password_confirmation = "adjlasdjsklad" }
    it { should_not be_valid }
  end

  describe "duplicate email" do
    before {
      user_same_email = @user.dup
      user_same_email.save!
    }
    it { should_not be_valid }
  end
end
