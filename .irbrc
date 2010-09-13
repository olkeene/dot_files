load File.dirname(__FILE__) + '/.railsrc' if $0 =~ /(rails|irb)/ && ENV['RAILS_ENV']

# Enables items.map(&:name) in regular irb
class Symbol
  def to_proc
    lambda {|*args| args.shift.__send__(self, *args)}
  end
end