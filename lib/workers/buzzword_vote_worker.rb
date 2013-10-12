class BuzzwordVoteWorker
  @queue = 'BuzzwordVote'

  def self.perform
    Rails.logger.debug "starting perform"
    BuzzwordVote.calculate_votes
    Rails.logger.debug "after perform"
  end

end