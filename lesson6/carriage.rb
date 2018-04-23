require_relative 'company'

class Carriage
  include Company

  def initialize(company_name)
    @company_name = company_name
    validate!
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise 'Company name can not be empty' if company_name.nil?
    true
  end
end