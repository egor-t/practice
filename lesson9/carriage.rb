# Carriage main class
require_relative 'company'

class Carriage
  include Company
  include Validation

  validate :company_name, :presence

  def initialize(company_name)
    @company_name = company_name
    validate!
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  protected

  def validate!
    raise 'Company name can not be empty' if company_name.nil?
    true
  end
end
