class Buzzword < ActiveRecord::Base

  before_create :downcase_word


  def self.increment_votes(bw, num=1)
    bw.gsub!(/_/, ' ')
    buzzword = Buzzword.where(word: bw).first
    buzzword.increment!(:votes, num) if buzzword
  end



  private


  def downcase_word
    word.downcase!
  end

end
