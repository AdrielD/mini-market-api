module CategoryExceptions
  I18N_KEY = 'api.errors.categories'

  class NameIsEmpty < ApiExceptions::ApiError
    def message
      I18n.t("#{I18N_KEY}.name_is_empty")
    end
  end

  class NameAlreadyExists < ApiExceptions::ApiError
    def message
      I18n.t("#{I18N_KEY}.name_already_exists")
    end
  end

  class CategoryNotEmpty < ApiExceptions::ApiError
    def message
      I18n.t("#{I18N_KEY}.category_not_empty")
    end
  end
end
