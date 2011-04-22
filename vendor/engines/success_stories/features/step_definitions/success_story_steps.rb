Given /^I have no success_stories$/ do
  SuccessStory.delete_all
end

Given /^I (only )?have success_stories titled "?([^\"]*)"?$/ do |only, titles|
  SuccessStory.delete_all if only
  titles.split(', ').each do |title|
    SuccessStory.create(:title => title)
  end
end

Then /^I should have ([0-9]+) success_stor[y|ies]+?$/ do |count|
  SuccessStory.count.should == count.to_i
end
