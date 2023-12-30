class ApiError < StandardError
  attr_reader :status

  def initialize(message)
    super(message)
    @status = :unprocessable_entity
  end

  def self.invalid_page_size
    ApiError.new I18n.t('api.errors.invalid_page_size')
  end

  def self.invalid_current_page
    ApiError.new I18n.t('api.errors.invalid_current_page')
  end

  def self.invalid_attribute_sorting(wrong_attribute, valid_attributes)
    ApiError.new I18n.t(
      'api.errors.invalid_attribute_sorting',
      wrong_attribute: wrong_attribute,
      valid_attributes: valid_attributes)
  end

  def self.invalid_order
    ApiError.new I18n.t('api.errors.invalid_order')
  end
end
