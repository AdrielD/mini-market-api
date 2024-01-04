class ApiError < StandardError
  attr_reader :status

  I18N_KEY = 'api.errors'

  def initialize(message)
    super(message)
    @status = :unprocessable_entity
  end

  class << self
    def invalid_page_size
      ApiError.new I18n.t("#{I18N_KEY}.invalid_page_size")
    end
  
    def invalid_current_page
      ApiError.new I18n.t("#{I18N_KEY}.invalid_current_page")
    end
  
    def invalid_attribute_sorting(wrong_attribute, valid_attributes)
      ApiError.new I18n.t(
        "#{I18N_KEY}.invalid_attribute_sorting",
        wrong_attribute: wrong_attribute,
        valid_attributes: valid_attributes)
    end
  
    def invalid_order
      ApiError.new I18n.t("#{I18N_KEY}.invalid_order")
    end
  end
end
