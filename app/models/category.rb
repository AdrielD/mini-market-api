class Category < ApplicationRecord
  include PgSearch::Model

  has_many :products

  pg_search_scope :search_name,
                  against: :name,
                  using: {
                    tsearch: { prefix: true, any_word: true }
                  }
end
