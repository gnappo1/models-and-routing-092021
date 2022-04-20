class Post < ApplicationRecord
    has_many :comments, counter_cache: true # 17 methods comments, comments= 
    validates :title, :content, :delete_time, presence: true
    validates :content, length: {in: (10..500)}
    validate :delete_time_in_the_future?
    before_save :format_title

    # scope :most_comments, -> {self.joins(:comments).group(:post_id).order("COUNT(posts.id) DESC").limit(1)}
    scope :sort_desc_by_title, -> {self.order(title: :desc)}
    scope :top_five_title_desc, -> {self.sort_desc_by_title.limit(5)}
    
    def format_title
      if self.title[0] != self.title[0].upcase
        self.title = self.title.capitalize
      end
    end

    def delete_time_in_the_future?
      if !!self.delete_time && self.delete_time <= DateTime.current
        self.errors.add(:delete_time, :time_warp, message: "The delete time should be in the future!!!")
      end
    end

    def automatic_destroyal
      if self.delete_time <= DateTime.current
        self.destroy
      end
    end

    def self.most_comments
      self.all.max_by {|p| p.comments.size}
    end


end
