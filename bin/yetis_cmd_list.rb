#!/usr/bin/ruby

require "xmlrpc/client"

if (ARGV.empty?)
  puts "usage: #{$0} host:port"
  exit
end

(host, port) = ARGV[0].split(':')
$s = XMLRPC::Client.new(host, "/", port)

def f(*args)
  puts args.take(args.size-1).join(' ')
  r = $s.call("di", "yeti", *args)
  return if !r.kind_of?(Array)
  r.each do |e|
    if e.kind_of?(Array)
      f(*args.first(args.size - 1), e[0], '_list')
    end
  end
end

begin
  f '_list'
rescue XMLRPC::FaultException => e
  puts "Error: #{e.faultCode} #{e.faultString}"
end
