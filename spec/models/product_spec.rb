require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:price).is_greater_than(0) }
  it { should validate_uniqueness_of(:sku).case_insensitive }

  describe '#missing_letter' do
    subject(:product) { build(:product, name: test_name, price: 10.0, sku: 'TESTSKU') }

    context 'when the name contains all letters from a-z' do
      let(:test_name) { 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' }

      it 'returns underscore ("_")' do
        expect(product.missing_letter).to eq('_')
      end
    end

    context 'when the letter "a" is missing' do
      let(:test_name) { 'bcdefghijklmnopqrstuvwxyz' }

      it 'returns "a"' do
        expect(product.missing_letter).to eq('a')
      end
    end

    context 'when a specific letter (e.g., "m") is missing' do
      let(:test_name) { 'abcdefghijklnopqrstuvwxyz' }

      it 'returns the first missing letter (e.g., "m")' do
        expect(product.missing_letter).to eq('m')
      end
    end

    context 'when the name has non-alphabetic characters' do
      let(:test_name) { '!@#$.' }

      it 'ignores non-alphabetic characters and finds the missing letter' do
        expect(product.missing_letter).to eq('a')
      end
    end

    context 'when the name has mixed casing' do
      let(:test_name) { 'PrOdUcT' }

      it 'is case-insensitive and returns the first missing letter' do
        expect(product.missing_letter).to eq('a')
      end
    end

    context 'when the name contains accented characters' do
      let(:test_name) { 'Computação' }

      it 'handles accented characters by removing or transliterating them' do
        expect(product.missing_letter).to eq('b')
      end
    end
  end
end
