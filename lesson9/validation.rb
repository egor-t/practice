# Validation module with few validation methods.
module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  # Validation class methods
  module ClassMethods
    def validate(attribute_name, validation_type, option = true)
      if validations[attribute_name]
        validations[attribute_name][validation_type] = {
          option: option,
          error_message: validation_errors(validation_type, attribute_name)
        }
      else
        set_validation(attribute_name, validation_type, option)
      end
    end

    def set_validation(attribute_name, validation_type, option = true)
      validations[attribute_name] = {
        validation_type => {
          option: option,
          error_message: validation_errors(validation_type, attribute_name)
        }
      }
    end

    def validations
      @validations ||= {}
    end

    private

    def validation_errors(type, attriute_name)
      errors = { presence: "The #{attriute_name} can't be blank.",
                 format: "The #{attriute_name} is inccorect format.",
                 type: "The #{attriute_name} is inccorrect type." }
      errors[type]
    end
  end

  # Validation instance methods
  module InstanceMethods
    def validate!
      self.class.validations.each do |attribute_name, value|
        value.each do |key, value|
          self.send("#{key}_validation", value[:error_message], attribute_name, value[:option])
        end
      end
      true
    end

    def valid?
      validate!
    rescue
      false
    end

    protected

    def presence_validation(error_message, attribute_name, option = true)
      raise error_message if [nil, ''].include?(self.public_send(attribute_name))
    end

    def format_validation(error_message, attribute_name, regex_format)
      raise error_message if self.public_send(attribute_name) !~ regex_format
    end

    def type_validation(error_message, attribute_name, type_option)
      raise error_message unless self.public_send(attribute_name).is_a? type_option
    end
  end
end