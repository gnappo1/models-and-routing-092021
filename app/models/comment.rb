class Comment < ApplicationRecord
  # @@bad_words = %w(shoot fudge accidempoli)
  belongs_to :post #will automatically validate post_id existance
  validates :rating, presence: true, numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}
  validates :content, presence: true, length: {in: 2..1000}#, inclusion: {in: %w(shoot fudge accidempoli), message: "You used inappropriate word(s). Please make sure you avoid any of the following: #{@@bad_words.join(", ")}"}
  # validate :respectable_words_check

  def respectable_words_check
    bad_words = %w(shoot fudge accidempoli)
    # if bad_words.any?{|bw| self.content.split(" ").include?(bw)}
    if self.content.match? /(shoot|fudge|accidempoli)/i
      self.errors.add(:content, :inappropriate, message: "You used inappropriate word(s). Please make sure you avoid any of the following: #{bad_words.join(", ")}")
    end
  end
end
