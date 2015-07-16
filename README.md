# jekyll-search_filter

Liquid filter for searching Jekyll data.

## Usage

The `search` filter allows for searching for items in an array that have a property with a certain value. For example, you could search the list of news data records that have a `title` with a value of `Title 1`.

```
{% assign result = site.data.news | search:'title', 'Title 1' %}
```

You can pass as many search values as necessary. The `search` filter will return items where the property value match any of the given values.

```
{% assign result = site.data.news | search:'title', 'Title 1', 'Title 2', 'Title 3' %}
```

You can pass multiple search values in an array. This comes in handy when you want to define that array as front matter in a page.

```
{% assign result = site.data.news | search:'title', page.titles %}
```
The property can be of type array. The `search` filter will return items where the array property contains any of the given values.

```
{% assign result = site.data.news | search:'tags', 'weather', 'sports' %}
```

See the [tests](https://github.com/cityoffortworth/jekyll-search_filter/blob/master/test/jekyll/search_filter_test.rb) for more details.
