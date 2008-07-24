#!/usr/bin/env ruby

unless ARGV[0]
  puts "usage: #{$0} root_file_name" 
  exit
end

root = ARGV[0]

alt_index=11

lines = IO.readlines(root+".gtx")
alt = Array.new
lines.each do |line|
  tokens = line.scan(/\w+/)
  alt << tokens[alt_index] if tokens[alt_index]
#  tokens.each_with_index { |t,i| puts [i, t].join(' ') }
end

puts alt

