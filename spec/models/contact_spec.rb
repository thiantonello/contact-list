# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'validations' do
    subject do
      Contact.new(name: 'Rudolph',
                  user_id: user.id)
    end

    let(:user) do
      User.create!(username: 'Mike')
    end

    context 'when needed attributes are present' do
      it 'is valid' do
        expect(subject.valid?).to be_truthy
      end
    end

    context 'when name is not present' do
      before { subject.name = nil }

      it 'is not valid without a name' do
        expect(subject.valid?).to be_falsey
        expect(subject.errors.full_messages).to include("Name can't be blank")
      end
    end

    context 'when name has already been taken' do
      before do
        Contact.create!(name: 'Rudolph',
                        user_id: user.id)
      end

      it 'is not valid to use a taken phone_number' do
        expect(subject.valid?).to be_falsey
        expect(subject.errors.full_messages).to include('Name has already been taken')
      end
    end

    context 'when user_id not present' do
      before { subject.user_id = nil }

      it 'is not valid without an user_id' do
        expect(subject.valid?).to be_falsey
        expect(subject.errors.full_messages).to include('User must exist')
      end
    end
  end
end
