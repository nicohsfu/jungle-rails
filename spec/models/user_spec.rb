require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validation: ' do

    it 'should pass if password and password_confirmation are equivalent' do
      @user = User.create(name:"Nico", email: "ni@co.com", password: "abc", password_confirmation: "abc")
      expect(@user.password).to eq @user.password_confirmation
    end

    it 'should pass if password and password_confirmation are NOT equivalent' do
      @user = User.create(name:"Nico", email: "ni@co.com", password: "abc", password_confirmation: "abcd")
      expect(@user.password).not_to eq @user.password_confirmation
    end

    it 'should check if the same email is used again for account registry' do
      @user1 = User.create(name:"Nico", email: "ni@co.com", password: "abc", password_confirmation: "abc")
      @user2 = User.create(name:"Bob", email: "ni@co.com", password: "def", password_confirmation: "def")

      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should check if email and name are present' do
      @user = User.create(name:"Nico", email: "ni@co.com", password: "abc", password_confirmation: "abc")
      expect(@user.valid?).to be true
    end
    
    it 'should check minimum passord length' do
      @user = User.create(name:"Nico", email: "ni@co.com", password: "a", password_confirmation: "a")
      
      puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 2 characters)")
    end
    
  end
  
  describe '.authenticate_with_credentials' do
    # examples for this class method here\]    
    it 'should check if user is logged in' do
      @user = User.create(name:"Nico", email: "ni@co.com", password: "abc", password_confirmation: "abc")
      login = User.authenticate_with_credentials("ni@co.com", "abc")
      expect(login).to eq @user
    end
  end

end
