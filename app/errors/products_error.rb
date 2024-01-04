class ProductsError < ApiError
  I18N_KEY = 'api.errors.products'

  def self.name_is_empty
    ProductsError.new I18n.t("#{I18N_KEY}.name_is_empty")
  end

  def self.inexistent_category
    ProductsError.new I18n.t("#{I18N_KEY}.inexistent_category")
  end

  def self.invalid_price
    ProductsError.new I18n.t("#{I18N_KEY}.invalid_price")
  end
end
