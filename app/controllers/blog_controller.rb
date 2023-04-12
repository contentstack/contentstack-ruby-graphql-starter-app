class BlogController < ApplicationController
  require 'pry'
  def index
    blog_heading = Blog::blog_menu
    @blog = blog_heading.data.all_page.to_h

    blog_archieved_false = Blog::getBlogArchivedFalseQuery
    @blog_archieved_false = blog_archieved_false.data.all_blog_post.to_h


    blog_archieved_true = Blog::getBlogArchivedTrueQuery
    @blog_archieved_true = blog_archieved_true.data.all_blog_post.to_h


  end

  def show()

    uid = params[:id]
    url = request.env['REQUEST_URI']

    blog_heading = Blog::blog_menu
    @blog = blog_heading.data.all_page.to_h


    blog_heading = Blog::getBlogEntryByUrl(url)
    @blog_entry = blog_heading.data.all_blog_post.to_h
    
  end
end
