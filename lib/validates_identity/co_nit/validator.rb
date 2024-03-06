# frozen_string_literal: true

class ValidatesIdentity
  module CoNit
    class Validator
      VALIDATION_REGULAR_EXPRESSION = /\A(\d{3})[\., ]?(\d{3})[\., ]?(\d{3})-?(\d{1})\z/i.freeze

      attr_reader :value

      def initialize(value)
        @value = value.to_s
      end

      def valid?
        return true if value.blank?
        return false if number.nil?

        verifier_digit == calculated_verifier_digit
      end

      def formatted
        return if result.nil?

        "#{result[1]}-#{result[2]}-#{result[3]}"
      end

      private

      def verifier_digit
        result[4].to_s
      end

      def result
        @result ||= VALIDATION_REGULAR_EXPRESSION.match(value)
      end

      def number
        return if result.nil?

        @number ||= "#{result[1]}#{result[2]}#{result[3]}"
      end

      def calculated_verifier_digit
        sum = multiply_and_sum([41, 37, 29, 23, 19, 17, 13, 7, 3], number)
        digit_verifier(sum % 11).to_s
      end

      def multiply_and_sum(array, number)
        multiplied = []
        number.scan(/\d{1}/).each_with_index { |e, i| multiplied[i] = e.to_i * array[i] }
        multiplied.inject { |s, e| s + e }
      end

      def digit_verifier(rest)
        rest < 2 ? rest : 11 - rest
      end
    end
  end
end
