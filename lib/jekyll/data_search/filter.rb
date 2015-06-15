require 'jekyll/data_search'

module Jekyll
  module DataSearch
    module Filter

      def search(input, property, value)
        return [] if input.nil?
        input.select do |item|
          item[property.to_s] == value
        end
      end

    end
  end
end

Liquid::Template.register_filter(Jekyll::DataSearch::Filter)
