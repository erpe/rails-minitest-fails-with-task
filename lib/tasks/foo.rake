# some pseudo rake task,
# that needs helper included
# the task itself works,
# but if you run 'rake test'
# *boom*

include Rails.application.routes.url_helpers
require "#{Rails.root}/app/helpers/tools_helper"      
include ToolsHelper

desc "this task makes use of route_helpers"
task do_something: :environment do
  Rake::Task['smthng:create_tools'].invoke
  Rake::Task['smthng:collect_urls'].invoke
  @myurls.each_pair do |k,v|
    puts "#{k} -> #{v}"
  end
end

namespace :smthng do
  desc "create tools"
  task create_tools: :environment do
    (1..10).each do |i|
      Tool.create(name: i.to_s)
    end
  end

  desc "collects urls"
  task collect_urls: :environment do
    @myurls ||= {}
    Tool.all.each do |tool|
      @myurls[decide_on_route(tool)] = tool_path(tool)
    end
  end
end
