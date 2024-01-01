class CategoriesError < ApiError
  I18N_KEY = 'api.errors.categories'

  def self.name_is_empty
    CategoriesError.new I18n.t("#{I18N_KEY}.name_is_empty")
  end

  def self.name_already_exists
    CategoriesError.new I18n.t("#{I18N_KEY}.name_already_exists")
  end
end
