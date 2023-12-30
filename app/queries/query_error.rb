class QueryError < StandardError
  attr_reader :status

  def initialize(message)
    super(message)
    @status = :unprocessable_entity
  end

  def self.invalid_page_size
    QueryError.new I18n.t('query.errors.invalid_page_size')
  end

  def self.invalid_current_page
    QueryError.new I18n.t('query.errors.invalid_current_page')
  end

  def self.invalid_attribute_sorting(wrong_attribute, valid_attributes)
    QueryError.new I18n.t(
      'query.errors.invalid_attribute_sorting',
      wrong_attribute: wrong_attribute,
      valid_attributes: valid_attributes)
  end

  def self.invalid_order
    QueryError.new I18n.t('query.errors.invalid_order')
  end
end
