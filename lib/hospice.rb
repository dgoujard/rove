require_relative 'hospice/support/storer'
require_relative 'hospice/builder'
require_relative 'hospice/category'
require_relative 'hospice/cookbook'
require_relative 'hospice/option'
require_relative 'hospice/package'
require_relative 'hospice/pattern'
require_relative 'hospice/selector'

module Hospice
  class << self
    def package(name, &block)
      Package.new(name, &block)
    end

    def template(name, &block)
      Template.new(name, &block)
    end

    def packages
      Package.all
    end

    def categories
      Category.all
    end

    def patterns
      Pattern.all
    end

    def load!(path)
      Dir["#{path.to_s}/*.rb"].each{|f| require f}
    end
  end
end