require 'jekyll/data_search'
require 'minitest/autorun'
require 'mocha/mini_test'

describe Jekyll::DataSearch::Filter do
  let(:filter) { Object.new.extend(Jekyll::DataSearch::Filter) }
  let(:people) {[
    { 'id' => 1, 'name' => 'John' },
    { 'id' => 2, 'name' => 'Sally' }
  ]}

  it 'find items matching property and value' do
    result = filter.search(people, 'name', 'Sally')
    assert_equal 1, result.length
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
