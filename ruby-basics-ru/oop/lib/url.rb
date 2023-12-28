# frozen_string_literal: true

require 'forwardable'
require 'uri'

# BEGIN

# работает но не понял как именно нужно применять Comparable
class Url
  extend Forwardable
  include Comparable
  
  attr_accessor :url
  def_delegators :url, :host, :scheme, :query, :port

  def initialize url
    @url = URI(url)
  end
  
  def query_params
    param_pairs.each_with_object({}) do |pair,h|
      key, value = pair.split('=')
       h[key.to_sym] = value
    end
  end

  def query_param key, value = nil
    query_params
    return query_params[key] if value.nil? # геттер
    return query_params[key] if query_params.key?(key) # когда ключ существует, но передали новый параметр

    new_params = param_pairs
      .reduce([]) { |acc, (key, value)| acc << "#{key}=#{value}" }
      .join('&')
    query = new_params
    value
  end

  def ==(other)
    # self <=>(other)
    host == other.host &&
    port == other.port &&
    scheme == other.scheme &&
    query_params == other.query_params
  end

  private
  # def <=> (other)
  #   result = host <=> other.host &&
  #            scheme <=> other.scheme &&
  #            query_params <=> other.query_params
  #   result == 0 ? true : false
  # end

  def param_pairs
    return [] if query.nil?
    query.split('&')
  end

end

# yandex_url = Url.new 'http://yandex.ru:80?key=value&key2=value2'
# puts yandex_url.host # yandex.ru
# puts yandex_url.scheme # http
# puts yandex_url.query_params # { key: 'value', key2: 'value2' }
# puts yandex_url.query_param(:key) # 'value'
# puts yandex_url.query_param(:key2, 'lala') # 'value2'
# puts yandex_url.query_param(:new, 'ehu') # 'ehu'
# puts yandex_url.query_param(:lalala) # nil
# puts yandex_url.query_param(:lalala, 'default') # 'default'

# google_url = Url.new 'https://google.com:80?a=b&c=d&lala=value'
# puts yandex_url == google_url # false

# yandex_url_same = Url.new 'http://yandex.ru?key2=value2&key=value'
# puts yandex_url == yandex_url_same # true
# END
