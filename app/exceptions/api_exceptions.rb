module ApiExceptions
  class ApiError < StandardError
    I18N_KEY = 'api.errors'

    attr_accessor :status

    def initialize(status = :unprocessable_entity)
      @status = status
    end
  end

  class InvalidPageSize < ApiError
    def message
      I18n.t("#{I18N_KEY}.invalid_page_size")
    end
  end

  class InvalidCurrentPage < ApiError
    def message
      I18n.t("#{I18N_KEY}.invalid_current_page")
    end
  end

  class InvalidAttributeSorting < ApiError
    def initialize(wrong_attribute = [], valid_attributes = [])
      @wrong_attribute = wrong_attribute
      @valid_attributes = valid_attributes
      super()
    end

    def message
      I18n.t(
        "#{I18N_KEY}.invalid_attribute_sorting",
        wrong_attribute: @wrong_attribute,
        valid_attributes: @valid_attributes,
        default: "#{I18N_KEY}.invalid_attribute_sorting_default"
      )
    end
  end

  class InvalidOrder < ApiError
    def message
      I18n.t("#{I18N_KEY}.invalid_order")
    end
  end
end
