class BlogController < ApplicationController
  include Blog
  def index
    blog_heading = blog_menu
    @blog = blog_heading.data.all_page.to_h

    blog_archieved_false = getBlogArchivedFalseQuery
    @blog_archieved_false = blog_archieved_false.data.all_blog_post.to_h


    blog_archieved_true = getBlogArchivedTrueQuery
    @blog_archieved_true = blog_archieved_true.data.all_blog_post.to_h


  end

  def show()

    uid = params[:id]
    url = request.env['REQUEST_URI']

    blog_heading = blog_menu
    @blog = blog_heading.data.all_page.to_h


    blog_heading = getBlogEntryByUrl(url)
    @blog_entry = blog_heading.data.all_blog_post.to_h
    
  end
end
