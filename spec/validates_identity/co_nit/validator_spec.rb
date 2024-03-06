# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ValidatesIdentity::CoNit::Validator do
  it 'accepts 123.456.789-6' do
    expect(described_class.new('123.456.789-6')).to be_valid
  end

  it 'accepts 123,456,789-6' do
    expect(described_class.new('123,456,789-6')).to be_valid
  end

  it 'accepts 1234567896' do
    expect(described_class.new('1234567896')).to be_valid
  end

  it 'accepts 123 456 789-6' do
    expect(described_class.new('123 456 789-6')).to be_valid
  end

  it 'rejects 10-01-23-123' do
    expect(described_class.new('10-01-23-123')).not_to be_valid
  end

  it 'rejects AA-123-123' do
    expect(described_class.new('AA-123-123')).not_to be_valid
  end

  it 'rejects 1-1' do
    expect(described_class.new('1-1')).not_to be_valid
  end

  it 'rejects 0-12-12' do
    expect(described_class.new('0-12-12')).not_to be_valid
  end

  it 'rejects 1-0-1' do
    expect(described_class.new('1-0-1')).not_to be_valid
  end

  it 'rejects 1-0' do
    expect(described_class.new('1-0')).not_to be_valid
  end

  it 'rejects A' do
    expect(described_class.new('A')).not_to be_valid
  end

  it 'accepts blank string' do
    expect(described_class.new('')).to be_valid
  end

  it 'accepts nil' do
    expect(described_class.new(nil)).to be_valid
  end
end
