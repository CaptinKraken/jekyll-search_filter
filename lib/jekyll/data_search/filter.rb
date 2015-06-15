require 'jekyll/data_search'

module Jekyll
  module DataSearch
    module Filter

      def search(input, property, value)
        return [] if input.nil?
        input.select do |item|
          property_value = item[property.to_s]
          if property_value.is_a?(Enumerable)
            property_value.include?(value)
          else
            property_value == value
          end
        end
      end

    end
  end
end

Liquid::Template.register_filter(Jekyll::DataSearch::Filter)
