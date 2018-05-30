=begin
uri = URI.parse("redis://redistogo:e85bbd9991f38e388b38f686da8f0d94@cod.redistogo.com:10951/")
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
=end