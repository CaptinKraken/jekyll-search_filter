require 'jekyll/data_search'
require 'minitest/autorun'
require 'mocha/mini_test'

describe Jekyll::DataSearch::Filter do
  let(:filter) { Object.new.extend(Jekyll::DataSearch::Filter) }
  let(:news) {[
    { 'id' => 1, 'title' => 'Title1', 'tags' => ['tag1', 'tag2'] },
    { 'id' => 2, 'title' => 'Title2', 'tags' => ['tag1'] }
  ]}

  it 'find items matching property and string value' do
    result = filter.search(news, 'title', 'Title1')
    assert_equal 1, result.length
  end

  it 'find items matching property and integer value' do
    result = filter.search(news, 'id', 2)
    assert_equal 1, result.length
    assert_equal 2, result[0]['id']
  end

  it 'find items with array property that contains value' do
    result = filter.search(news, 'tags', 'tag1')
    assert_equal 2, result.length
  end

  it 'handle empty arrays' do
    data = filter.search([], 'name', 'Sally')
    assert_equal 0, data.length
  end

  it 'handle nil arrays' do
    data = filter.search(nil, 'name', 'Sally')
    assert_equal 0, data.length
  end
end
