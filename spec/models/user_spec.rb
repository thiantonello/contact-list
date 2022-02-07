# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject do
      User.new(username: 'Mike',
               biography: 'I am a developer',
               age: 25)
    end

    context 'when all attributes are present' do
      it 'is valid' do
        expect(subject.valid?).to be_truthy
      end
    end

    context 'when username is not present' do
      it 'is not valid without a username' do
        subject.username = nil
        expect(subject.valid?).to be_falsey
      end
    end
  end
end
