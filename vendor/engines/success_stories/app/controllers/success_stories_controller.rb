class SuccessStoriesController < ApplicationController

  before_filter :find_all_success_stories
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @success_story in the line below:
    present(@page)
  end

  def show
    @success_story = SuccessStory.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @success_story in the line below:
    present(@page)
  end

protected

  def find_all_success_stories
    @success_stories = SuccessStory.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/success_stories").first
  end

end
