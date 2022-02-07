# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'validations' do
    let(:user) do
      User.create(username: 'Mike',
                  biography: 'I am a developer',
                  age: 25)
    end

    subject do
      Contact.new(name: 'Rudolph',
                  user_id: user.id)
    end

    context 'when all attributes are present' do
      it 'is valid' do
        expect(subject.valid?).to be_truthy
      end
    end

    context 'when name is not present' do
      it 'is not valid without a name' do
        subject.name = nil
        expect(subject.valid?).to be_falsey
      end
    end

    context 'when user_id not present' do
      it 'is not valid without an user_id' do
        subject.user_id = nil
        expect(subject.valid?).to be_falsey
      end
    end
  end
end
