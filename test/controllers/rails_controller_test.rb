require 'test_helper'

class RailsControllerTest < ActionDispatch::IntegrationTest
  test "should get db:migrate" do
    get rails_db:migrate_url
    assert_response :success
  end

end
