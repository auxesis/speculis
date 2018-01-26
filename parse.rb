# frozen-string-literal: true

require 'graphviz'
require 'json'
require 'pry'

exit(1) if ARGV.size == 0

filename = ARGV.first
GraphViz.parse(filename, path: '/usr/local/bin') do |g|
  g.each_node do |id, node|
    @packages ||= {}
    @packages[id] = node[:label].to_s[1..-2]

    @mappings ||= {}
    @mappings[id] = node.neighbors.map { |n| n.id }
    # p node.neighbors.map { |n| [ n.id, n[:label].to_s[1..-2] ] }
  end
end

cyclical = []
acyclical = []

@mappings.each do |primary, neighbors|
  neighbors.each do |foreign|
    if @mappings[foreign].any? { |k| k == primary }
      cyclical << [primary, foreign]
    else
      acyclical << [primary, foreign]
    end
  end
end

json = { packages: @packages, acyclical: acyclical, cyclical: cyclical }.to_json
puts json
