# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  describe 'validations' do
    subject do
      PhoneNumber.new(phone_number: '123',
                      label: 0,
                      main: true,
                      contact: contact)
    end

    let(:user) do
      User.create!(username: 'Mike',
                   biography: 'I am a developer',
                   age: 25)
    end

    let(:contact) do
      Contact.create!(name: 'Rudolph',
                      user: user)
    end

    context 'when needed attributes are present' do
      it 'is valid' do
        expect(subject.valid?).to be_truthy
      end
    end

    context 'when number is not present' do
      before { subject.phone_number = nil }

      it 'is not valid without a phone_number' do
        expect(subject.valid?).to be_falsey
        expect(subject.errors.full_messages).to include("Phone number can't be blank")
      end
    end

    context 'when phone_number has already been taken' do
      before do
        PhoneNumber.create!(phone_number: '123',
                            label: 0,
                            contact: contact)
      end

      it 'is not valid to use a taken phone_number' do
        expect(subject.valid?).to be_falsey
        expect(subject.errors.full_messages).to include('Phone number has already been taken')
      end
    end

    context 'when label is not present' do
      before { subject.label = nil }

      it 'is not valid without a label' do
        expect(subject.valid?).to be_falsey
        expect(subject.errors.full_messages).to include("Label can't be blank")
      end
    end

    context 'when main is not present' do
      before { subject.main = nil }

      it 'is not valid without primary' do
        expect(subject.valid?).to be_falsey
        expect(subject.errors.full_messages).to include('Main is not included in the list')
      end
    end

    context 'when contact_id not present' do
      before { subject.contact = nil }

      it 'is not valid without an user_id' do
        expect { subject.save! }.to raise_error(NoMethodError, "undefined method `phone_numbers' for nil:NilClass")
      end
    end
  end

  describe '#set_main_if_phone_numbers_is_empty' do
    context 'when phone_numbers is empty and new phone_number is not main' do
      subject do
        PhoneNumber.new(phone_number: '123',
                        label: 0,
                        main: false,
                        contact: contact)
      end

      let(:user) do
        User.create!(username: 'Mike')
      end

      let(:contact) do
        Contact.create!(name: 'Rudolph',
                        user: user)
      end

      it 'sets subject.main to be true before save' do
        subject.save

        expect(subject.main).to be true
      end
    end
  end

  describe '#ensure_only_one_phone_number_is_main' do
    context 'when there is already a main phone_number and a new main phone_number is created' do
      subject do
        PhoneNumber.new(phone_number: '1234',
                        label: 0,
                        main: true,
                        contact: contact)
      end

      let(:user) do
        User.create!(username: 'Mike')
      end

      let(:contact) do
        Contact.create!(name: 'Rudolph',
                        user: user)
      end

      before do
        PhoneNumber.create!(phone_number: '123',
                            label: 1,
                            main: true,
                            contact: contact)
      end

      it 'sets all other phone_numbers to be false before save' do
        subject.save

        expect(contact.phone_numbers.first.main).to be_falsey
      end
    end
  end
end
