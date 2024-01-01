class Service
  def call
    validate()
    perform()
  end

  def validate
    raise "Method 'validate' is not implemented"
  end

  def perform
    raise "Method 'perform' is not implemented"
  end
end
