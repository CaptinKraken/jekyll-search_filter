# jekyll-data_search

Liquid filter for searching Jekyll data.

## Usage

The `search` filter allows for searching for items in an array that have a property with a certain value. For example, you could search the list of news data records that have a `title` with a value of `Title 1`.

```
{% assign result = site.data.news | search:'title', 'Title 1'}
```

You can pass as many matching values as necessary. The `search` filter will return items where the property value match any of the given values.

```
{% assign result = site.data.news | search:'title', 'Title 1', 'Title 2', 'Title 3'}
```

The property can be of type array. The `search` filter will return items where the array property contains any of the given values.

```
{% assign result = site.data.news | search:'tags', 'weather', 'sports'}
```

See the [tests](https://github.com/cityoffortworth/jekyll-data_search/blob/master/test/jekyll/data_search/filter_test.rb) for more details.
