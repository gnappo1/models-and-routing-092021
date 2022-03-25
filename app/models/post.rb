class Post < ApplicationRecord
    has_many :comments # 17 methods comments, comments= 
    validates :title, :content, presence: true
    validates :content, length: {in: (10..500)}
    before_save :format_title
    scope :most_comments, -> {self.joins(:comments).group(:post_id).order("COUNT(posts.id) DESC").limit(1)}
    scope :sort_desc_by_title, -> {self.order(title: :desc)}

    def format_title
      if self.title[0] != self.title[0].upcase
        self.title = self.title.capitalize
      end
    end

    # def self.most_comments
    #     # self.preload(:comments).all.max_by{|p| p.comments.length}
    #     self.joins(:comments).group(:post_id).order("COUNT(posts.id) DESC").limit(1)
    # end


end
