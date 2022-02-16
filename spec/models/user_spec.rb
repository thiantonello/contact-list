# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject do
      User.new(username: 'Mike')
    end

    context 'when needed attributes are present' do
      it 'is valid' do
        expect(subject.valid?).to be_truthy
      end
    end

    context 'when username is not present' do
      before { subject.username = nil }

      it 'is not valid without a username' do
        expect(subject.valid?).to be_falsey
        expect(subject.errors.full_messages).to include("Username can't be blank")
      end
    end

    context 'when username has already been taken' do
      before do
        User.create!(username: 'Tom')

        subject.username = 'Tom'
      end

      it 'is not valid to use a taken username' do
        expect(subject.valid?).to be_falsey
        expect(subject.errors.full_messages).to include('Username has already been taken')
      end
    end
  end
end
