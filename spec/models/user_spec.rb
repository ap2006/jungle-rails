require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
      # validation tests/examples here
  subject do
      User.new({
        :firstname => 'Tina',
        :lastname => 'Fey',
        :email => 'tina@tinafey.com',
        :password => 'tinarocks'
      })
    end

      it 'is valid with valid attributes' do
        expect(subject).to be_valid
      end

      it 'is not valid without a first name' do
        subject.firstname = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without a last name' do
        subject.lastname = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without an email' do
        subject.email = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without a password' do
        subject.password = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without a password length of at least 8' do
        subject.password = 'abcdefg'
        expect(subject).to_not be_valid
    end
  end

#Authenication class method code goes here
  describe '.authenticate_with_credentials' do
      # examples for this class method here
      subject do
          User.create({
            :firstname => 'Amy',
            :lastname => 'Brown',
            :email => 'amy@amy.com',
            :password => 'amyrules',
            :password_confirmation => 'amyrules'
          })
        end
        it 'is not valid because user is not in database' do
          user = User.authenticate_with_credentials('vasily@gmail.com', 'ertyuhgfd')
          expect(user).to be_nil
      end
      it 'is valid because user is in database' do
        User.create({
          :firstname => 'Amy',
          :lastname => 'Brown',
          :email => 'amy@amy.com',
          :password => 'amyrules',
          :password_confirmation => 'amyrules'
        })
        user = User.authenticate_with_credentials('amy@amy.com', 'amyrules')
        expect(user).to be_truthy
      end
    end
end
