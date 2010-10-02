module DateHelper
  
  def time_ago(start_time)
  
    diff_seconds = (Time.now - start_time).round
    diff_minutes = (diff_seconds/60).round
    diff_days = (diff_minutes/60/24).round
        
    time_formatted = (diff_days > 5) ? 
      start_time.strftime("%b %d, '%y at %I:%M") : 
      "#{time_ago_in_words(start_time)} ago" 
                  
  end
  
end