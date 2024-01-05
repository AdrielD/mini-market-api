module ProductExceptions
  I18N_KEY = 'api.errors.products'

  class NameIsEmpty < ApiExceptions::ApiError
    def message
      I18n.t("#{I18N_KEY}.name_is_empty")
    end 
  end

  class InexistentCategory < ApiExceptions::ApiError
    def message
      I18n.t("#{I18N_KEY}.inexistent_category")
    end 
  end

  class InvalidPrice < ApiExceptions::ApiError
    def message
      I18n.t("#{I18N_KEY}.invalid_price")
    end 
  end
end
