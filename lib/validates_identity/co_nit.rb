# frozen_string_literal: true

require 'validates_identity'
require_relative 'co_nit/version'

class ValidatesIdentity
  module CoNit
    autoload :Validator, 'validates_identity/co_nit/validator'
  end
end

# Legal
ValidatesIdentity.register_legal_identity_type('CO_NIT_LEGAL', ValidatesIdentity::CoNit::Validator)
ValidatesIdentity::ShouldaMatchers.register_legal_allowed_values('CO_NIT_LEGAL', %w[123.456.789-6 1234567896 123,456,789-6])
ValidatesIdentity::ShouldaMatchers.register_legal_disallowed_values('CO_NIT_LEGAL', %w[90-234-1-23 10-0-123-123])

# Person
ValidatesIdentity.register_person_identity_type('CO_NIT_PERSON', ValidatesIdentity::CoNit::Validator)
ValidatesIdentity::ShouldaMatchers.register_person_allowed_values('CO_NIT_PERSON', %w[123.456.789-6 1234567896 123,456,789-6])
ValidatesIdentity::ShouldaMatchers.register_person_disallowed_values('CO_NIT_PERSON', %w[90-234-1-23 10-0-123-123])
