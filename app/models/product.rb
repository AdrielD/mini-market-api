class Product < ApplicationRecord
  include PgSearch::Model

  belongs_to :category

  pg_search_scope :search_name,
                  against: :name,
                  using: {
                    tsearch: { prefix: true, any_word: true }
                  }
end
