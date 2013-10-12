require 'redis-namespace'

class BuzzwordVote
  @redis    = nil
  @buzzword = nil

  # @param [Buzzword]
  def initialize(buzzword)
    @buzzword = buzzword
  end


  def vote
    increment
  end



  private



  def self.all_buzzwords
    self.redis_server.keys
  end


  def self.calculate_votes
    self.all_buzzwords.each do |bw|
      key = self.clean_for_redis(bw)
      redis_server.del key
      Rails.logger.debug "got vote for #{bw}"
      Buzzword.increment_votes(bw)
    end
  end


  def increment
    redis_server.setnx BuzzwordVote.clean_for_redis(@buzzword), 1
  end


  def self.namespace
    self.to_s
  end


  # @return [Redis::Namespace] redis server
  def redis_server
    if @redis.blank?
      @redis = Redis::Namespace.new(self.class.namespace)
    end
    @redis
  end


  def self.redis_server
    if @redis.blank?
      @redis = Redis::Namespace.new(self.namespace)
    end
    @redis
  end


  private


  def self.clean_for_redis(word)
    word.gsub(/\s/, '_')
  end

end
