class ProductsError < ApiError
  I18N_KEY = 'api.errors.products'

  class << self
    def name_is_empty
      ProductsError.new I18n.t("#{I18N_KEY}.name_is_empty")
    end
  
    def inexistent_category
      ProductsError.new I18n.t("#{I18N_KEY}.inexistent_category")
    end
  
    def invalid_price
      ProductsError.new I18n.t("#{I18N_KEY}.invalid_price")
    end
  end
end
