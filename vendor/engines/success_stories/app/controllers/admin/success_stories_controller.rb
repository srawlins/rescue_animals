module Admin
  class SuccessStoriesController < Admin::BaseController

    crudify :success_story, :xhr_paging => true

  end
end
