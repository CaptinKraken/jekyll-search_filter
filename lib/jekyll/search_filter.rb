require 'jekyll'

module Jekyll
  module SearchFilter

    def search(input, property, *args)
      return [] if input.nil?
      input.select do |item|
        property_value = item[property.to_s]
        if property_value.is_a?(Enumerable)
          args.any? { |arg| property_value.include?(arg) }
        else
          args.any? { |arg| arg == property_value }
        end
      end
    end

  end
end

Liquid::Template.register_filter(Jekyll::SearchFilter)
