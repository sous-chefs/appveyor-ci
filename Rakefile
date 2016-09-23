require 'bundler/setup'

namespace :style do
  require 'rubocop/rake_task'
  desc 'Run Ruby style checks'
  RuboCop::RakeTask.new(:ruby) do |t|
    t.formatters = ['simple']
  end

  require 'foodcritic'
  desc 'Run Chef style checks'
  FoodCritic::Rake::LintTask.new(:chef) do |f|
    f.options =  { tags: ['~FC016', '~FC009'] }
  end
end

desc 'Run all style checks'
task style: ['style:chef', 'style:ruby']

task default: %w(style)

require 'stove/rake_task'
Stove::RakeTask.new
