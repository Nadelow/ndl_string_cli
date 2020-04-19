require 'bundler/setup'
require 'ndl_string'
require 'dry/cli'

module Ndl_string
  module CLI
    module Commands
      extend Dry::CLI::Registry

      class Valid_brackets < Dry::CLI::Command
        desc 'Checking the correct sequence of brackets in a string!'

        argument :str, required: true, desc: 'The input string to check'

        def call(str:, **)
          str.valid_brackets?
        end
      end

      class Palindrome < Dry::CLI::Command
        desc 'Checking a string on a palindrome'

        argument :str, required: true, desc: 'The input string to check'

        def call(str:, **)
          str.palindrome?
        end
      end

      register 'valid_brackets', Valid_brackets
      register 'palindrome', Palindrome
    end
  end
end

Dry::CLI.new(Ndl_string::CLI::Commands).call
