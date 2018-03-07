require 'minitest/autorun'
require 'rbchannels'

class ChannelsTest < Minitest::Test

  def test_base_uri
    client = Channels::Client.new("192.168.1.50", 8888)
    assert_equal "http://192.168.1.50:8888/api", client.class.base_uri
  end

end
