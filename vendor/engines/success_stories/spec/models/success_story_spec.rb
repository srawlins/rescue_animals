require 'spec_helper'

describe SuccessStory do

  def reset_success_story(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @success_story.destroy! if @success_story
    @success_story = SuccessStory.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_success_story
  end

  context "validations" do
    
    it "rejects empty title" do
      SuccessStory.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_success_story
      SuccessStory.new(@valid_attributes).should_not be_valid
    end
    
  end

end