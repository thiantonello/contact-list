# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  describe 'validations' do
    let(:user) do
      User.create(username: 'Mike',
                  biography: 'I am a developer',
                  age: 25)
    end

    let(:contact) do
      Contact.create(name: 'Rudolph',
                     user_id: user.id)
    end

    subject do
      PhoneNumber.new(phone_number: '00123456789',
                      label: 'work',
                      primary: FalseClass,
                      contact_id: contact.id)
    end

    context 'when all attributes are present' do
      it 'is valid' do
        expect(subject.valid?).to be_truthy
      end
    end

    context 'when number is not present' do
      it 'is not valid without a phone_number' do
        subject.phone_number = nil
        expect(subject.valid?).to be_falsey
      end
    end

    context 'when label is not present' do
      it 'is not valid without a label' do
        subject.label = nil
        expect(subject.valid?).to be_falsey
      end
    end

    context 'when primary is not present' do
      it 'is not valid without primary' do
        subject.primary = nil
        expect(subject.valid?).to be_falsey
      end
    end

    context 'when contact_id not present' do
      it 'is not valid without an user_id' do
        subject.contact_id = nil
        expect(subject.valid?).to be_falsey
      end
    end
  end
end
