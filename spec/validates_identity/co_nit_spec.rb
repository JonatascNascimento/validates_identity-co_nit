# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ValidatesIdentity::CoNit do
  let(:user) { User.new }

  context 'with a legal identity type' do
    context 'with a valid value' do
      context 'without formatting' do
        before do
          user.legal_identity = '23456789-9-0102'
          user.legal_identity_type = 'CO_NIT_LEGAL'
          user.valid?
        end

        it 'leaves the value as it is' do
          expect(user.legal_identity).to eq('23456789-9-0102')
        end
      end

      context 'with formatting' do
        before do
          user.legal_formatted_identity = '23456789-9-0102'
          user.legal_identity_type = 'CO_NIT_LEGAL'
          user.valid?
        end

        it 'formats the value' do
          expect(user.legal_formatted_identity).to eq('23456789-9-0102')
        end
      end
    end

    context 'with an invalid value' do
      before do
        user.legal_identity = '123456'
        user.legal_identity_type = 'CO_NIT_LEGAL'
        user.valid?
      end

      it 'leaves the original value' do
        expect(user.legal_identity).to eq('123456')
      end
    end
  end

  context 'with a person identity type' do
    context 'with a valid value' do
      context 'without formatting' do
        before do
          user.person_identity = 'PE-23-123'
          user.person_identity_type = 'CO_NIT_PERSON'
          user.valid?
        end

        it 'leaves the value as it is' do
          expect(user.person_identity).to eq('PE-23-123')
        end
      end

      context 'with formatting' do
        before do
          user.person_formatted_identity = 'PE-23-123'
          user.person_identity_type = 'CO_NIT_PERSON'
          user.valid?
        end

        it 'formats the value' do
          expect(user.person_formatted_identity).to eq('PE-23-123')
        end
      end
    end

    context 'with an invalid value' do
      before do
        user.person_identity = '123456'
        user.person_identity_type = 'CO_NIT_PERSON'
        user.valid?
      end

      it 'leaves the original value' do
        expect(user.person_identity).to eq('123456')
      end
    end
  end
end
