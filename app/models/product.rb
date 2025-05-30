class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :sku, presence: true, uniqueness: { case_sensitive: false }

  scope :ordered_by_name, -> { order(:name) }

  def missing_letter
    cleaned_name = name.parameterize.gsub(/[^a-z]/, "")
    present_letters_mapping = {}

    cleaned_name.each_char do |char| 
      present_letters_mapping[char] = true 
    end

    ('a'..'z').each do |letter|
      return letter unless present_letters_mapping.key?(letter)
    end

    '_'
  end
end
