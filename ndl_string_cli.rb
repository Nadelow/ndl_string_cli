# frozen_string_literal: true

require 'bundler/setup'
require 'ndl_string'
require 'dry/cli'

# NdlString module for CLI
module NdlString
  module CLI
    # CLI Commands
    module Commands
      extend Dry::CLI::Registry

      # Valid_brackets CLI command
      class ValidBrackets < Dry::CLI::Command
        desc 'Checking the correct sequence of brackets in a string!'

        argument :str, required: true, desc: 'The input string to check'

        def call(str:, **)
          puts str.valid_brackets?
        end
      end

      # Palindrome CLI command
      class Palindrome < Dry::CLI::Command
        desc 'Checking a string on a palindrome'

        argument :str, required: true, desc: 'The input string to check'

        def call(str:, **)
          puts str.palindrome?
        end
      end

      register 'valid_brackets', ValidBrackets
      register 'palindrome', Palindrome
    end
  end
end

Dry::CLI.new(NdlString::CLI::Commands).call
