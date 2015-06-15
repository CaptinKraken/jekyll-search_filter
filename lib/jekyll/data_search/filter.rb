require 'jekyll/data_search'

module Jekyll
  module DataSearch
    module Filter

      def search(input, property, values)
        return [] if input.nil?
        return input
      end

    end
  end
end

Liquid::Template.register_filter(Jekyll::DataSearch::Filter)
