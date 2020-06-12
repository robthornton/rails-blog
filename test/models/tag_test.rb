# frozen_string_literal: true

require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test 'tag has name' do
    tag = tags(:tag)
    assert_equal('tag', tag.name)
  end

  test 'new tag has name' do
    tag = Tag.create!(name: 'new')
    assert_equal('new', tag.name)
  end

  test 'unable to create tag with no name' do
    assert_raise { Tag.create! }
  end

  test 'unable to create tag with empty name' do
    assert_raise { Tag.create!(name: '') }
  end
end
