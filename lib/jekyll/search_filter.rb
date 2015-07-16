require 'jekyll'

module Jekyll
  module SearchFilter

    def search(input, property, *args)
      return [] if input.nil?
      input.select do |item|
        property_value = item_property(item, property)
        if property_value.is_a?(Enumerable)
          args.any? { |arg| property_value.include?(arg) }
        else
          args.any? { |arg| arg == property_value }
        end
      end
    end

    private

    # Copied from https://github.com/jekyll/jekyll/blob/92a9582733dfee0f359e491a8fae236e91087a54/lib/jekyll/filters.rb#L314-L322
    def item_property(item, property)
      if item.respond_to?(:to_liquid)
        item.to_liquid[property.to_s]
      elsif item.respond_to?(:data)
        item.data[property.to_s]
      else
        item[property.to_s]
      end
    end

  end
end

Liquid::Template.register_filter(Jekyll::SearchFilter)
