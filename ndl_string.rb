require "bundler/setup"
require "dry/cli"

module Ndl_string
  module CLI
    module Commands
      extend Dry::CLI::Registry

      class Valid_brackets < Dry::CLI::Command
        desc 'Checking the correct sequence of brackets in a string!'

        argument :str, required: true, desc: 'The input string to check'

        def call(str:, **)
          counter = 0

          str.each_char do |char|
            if char == '('
              counter += 1
            elsif char == ')'
              counter -= 1
            end

            return false if counter.negative?
          end

          counter.zero?
        end
      end

      class Palindrome < Dry::CLI::Command
        desc 'Checking a string on a palindrome'

        argument :str, required: true, desc: 'The input string to check'

        def call(str:, **)
          true_string = str.downcase.scan(/\w/)
          true_string == true_string.reverse
        end
      end

      register 'valid_brackets', Valid_brackets
      register 'palindrome', Palindrome
    end
  end
end

Dry::CLI.new(Ndl_string::CLI::Commands).call