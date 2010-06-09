require File.dirname(__FILE__) + '/../../../spec/spec_helper'
require RAILS_ROOT+'/vendor/plugins/monkeys/init'
require RAILS_ROOT+'/vendor/plugins/classic_pagination/lib/pagination'
describe "/servants/index" do
  before do
    @article = mock_model(Article, :created_at => Time.now, :published_at => Time.now)
    Article.stub!(:find).and_return(@article)
    @blog = mock_model(Blog, :use_gravatar => false)
    @blog.stub!(:lang).and_return('en_US')
    @blog.stub!(:limit_article_display).and_return(100)
    @controller.template.stub!(:this_blog).and_return(@blog)
    Blog.stub!(:find).and_return(@blog)

    assigns[:pages] = ActionController::Pagination::Paginator.new nil, 2, 3, 1
    assigns[:comment] = @comment
    render "articles/index"
    
  end
  
  it "should have a list of servants" do
    response.should have_tag("li", /#{@link}/)
  end
end