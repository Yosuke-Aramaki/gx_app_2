require 'test_helper'

class MajorTasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get major_tasks_index_url
    assert_response :success
  end

end
