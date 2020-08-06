require 'rbchannels/version'
require 'httparty'

class Channels::Client
  include HTTParty
  default_timeout 2
  format :json

  def initialize(host, port=57000)
    self.class.base_uri "http://#{host}:#{port}/api"
  end

  def status
    request("GET", "/status")
  end

  def favorite_channels
    request("GET", "/favorite_channels")
    if response.is_a?(Array)
      response
    else
      []
    end
  end

  def previous_channel
    command('previous_channel')
  end

  def toggle_pause
    command('toggle_pause')
  end

  def pause
    command('pause')
  end

  def resume
    command('resume')
  end

  def stop
    command('stop')
  end

  def seek(seconds=0)
    command("seek/#{seconds}")
  end

  def seek_forward
    command('seek_forward')
  end

  def seek_backward
    command('seek_backward')
  end

  def skip_forward
    command('skip_forward')
  end

  def skip_backward
    command('skip_backward')
  end

  def toggle_mute
    command('toggle_mute')
  end

  def play_channel(channel_number)
    command("play/channel/#{channel_number}")
  end

  def play_recording(recording_id)
    command("play/recording/#{recording_id}")
  end


  private

  def request(method, path, data=nil)
    headers = {"Content-Type": "application/json", "Accept": "application/json"}
    begin
      case method
      when "GET"
        response = self.class.get(path, headers: headers)
      when "POST"
        response = self.class.post(path, {body: data.to_json, headers: headers})
      when "PUT"
        response = self.class.put(path, body: data.to_json, headers: headers)
      when "DELETE"
        response = self.class.delete(path, headers: headers)
      end

      if response
        response.parsed_response
      else
        {'status': 'error'}
      end
    rescue
      {'status': 'error'}
    end
  end

  def command(named_command, data=nil)
    return request('POST', '/' + named_command, data)
  end

end
