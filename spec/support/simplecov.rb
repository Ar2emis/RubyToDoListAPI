require 'simplecov'

CONCEPTS = %w[task project user comment session].freeze
CONTRACTS = CONCEPTS.map { |concept| "app/concepts/#{concept}/contracts/" }
                    .append('app/concepts/application_contract.rb').freeze
OPERATONS = CONCEPTS.map { |concept| "app/concepts/#{concept}/" }.freeze

SimpleCov.start 'rails' do
  minimum_coverage 90
  add_group('Contracts', CONTRACTS)
  add_group('Operations', OPERATONS)
  add_group('Serializers', 'app/serializers')
  add_group('Uploaders', 'app/uploaders')
  add_group('Services', 'app/services')
end
