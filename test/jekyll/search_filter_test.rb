require 'jekyll/search_filter'
require 'minitest/autorun'
require 'mocha/mini_test'

describe Jekyll::SearchFilter do
  let(:filter) { Object.new.extend(Jekyll::SearchFilter) }
  let(:news) {[
    { 'id' => 1, 'title' => 'Title1', 'tags' => ['tag1', 'tag2'] },
    { 'id' => 2, 'title' => 'Title2', 'tags' => ['tag1', 'tag3'] }
  ]}

  describe 'find items' do
    it 'given property and string value' do
      result = filter.search(news, 'title', 'Title1')
      assert_equal 1, result.length
    end

    it 'given property and integer value' do
      result = filter.search(news, 'id', 2)
      assert_equal 1, result.length
      assert_equal 2, result[0]['id']
    end

    it 'given property and multiple values' do
      result = filter.search(news, 'id', 1, 2)
      assert_equal 2, result.length
    end

    it 'given property and an array value' do
      search_value = [1, 2]
      result = filter.search(news, 'id', search_value)
      assert_equal 2, result.length
    end

    it 'given array property and one match' do
      result = filter.search(news, 'tags', 'tag2')
      assert_equal 1, result.length
    end

    it 'given array property and two matches' do
      result = filter.search(news, 'tags', 'tag1')
      assert_equal 2, result.length
    end

    it 'given array property and multiple values' do
      result = filter.search(news, 'tags', 'tag2', 'tag3')
      assert_equal 2, result.length
    end

    it 'given array property and an array value' do
      search_value = ['tag2', 'tag3']
      result = filter.search(news, 'tags', search_value)
      assert_equal 2, result.length
    end
  end

  it 'handle empty arrays' do
    result = filter.search([], 'name', 'Sally')
    assert_equal 0, result.length
  end

  it 'handle nil arrays' do
    result = filter.search(nil, 'name', 'Sally')
    assert_equal 0, result.length
  end
end
