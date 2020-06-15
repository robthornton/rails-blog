# frozen_string_literal: true

require 'test_helper'

class StatsControllerTest < ActionDispatch::IntegrationTest
  test 'stats page ok' do
    get('/stats')
    assert_response(:success)
  end
end
