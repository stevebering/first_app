class Post < ActiveRecord::Base
  validates :name, :presence => true
  validates :title, :presence => true, 
                    :length => { :minimum => 5 }

  has_many :comments, :dependent => :destroy
  
  def posted_date
    diff = Time.now - created_at
    showSeconds = diff
    showMinutes = (diff/60).round.to_i
    showHours = (showMinutes/60).round.to_i
    showDays = (showHours/24).round.to_i
    formattedDate = created_at.localtime().strftime("%A, %B %d, %Y")
    prefix = showSeconds < 60 ? "less than a minute ago" :
      showSeconds < 120 ? "1 minute ago" :
      showMinutes < 60  ? "#{showMinutes.round.to_i} minutes ago" :
      showMinutes = 60 ? "1 hour ago" :
      showHours < 24 ? "#{showHours.round.to_i} hours ago" :
      showDays < 5 ? "#{showDays.round.to_i} days ago" :
      "#{formattedDate}"
  end
end
