User.all.each do |user|
  if user.plugins.where(:name => 'success_stories').blank?
    user.plugins.create(:name => 'success_stories',
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end

page = Page.create(
  :title => 'Success Stories',
  :link_url => '/success_stories',
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => '^/success_stories(\/|\/.+?|)$'
)
Page.default_parts.each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end
