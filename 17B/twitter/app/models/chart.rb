class Chart

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def create_chart
    LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "Tweets for #{user.email}")
      f.xAxis(:categories => 5.downto(1).map { |num| num.days.ago.strftime('%a') })
      f.series(:name => "Tweets per day", :yAxis => 0, :data => [
        user.tweets.where(created_at: 5.days.ago.beginning_of_day..5.days.ago.end_of_day).count,
        user.tweets.where(created_at: 4.days.ago.beginning_of_day..4.days.ago.end_of_day).count,
        user.tweets.where(created_at: 3.days.ago.beginning_of_day..3.days.ago.end_of_day).count,
        user.tweets.where(created_at: 2.days.ago.beginning_of_day..2.days.ago.end_of_day).count,
        user.tweets.where(created_at: 1.days.ago.beginning_of_day..1.days.ago.end_of_day).count
      ])

      f.yAxis [
        {:title => {:text => "Tweets per day", :margin => 70} }
      ]

      f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
      f.chart({:defaultSeriesType=>"column"})
    end
  end
end