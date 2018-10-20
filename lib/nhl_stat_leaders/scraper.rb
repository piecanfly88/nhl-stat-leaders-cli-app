class NhlStatLeaders::Scraper

  def self.get_page
    html = open("https://www.cbssports.com/nhl/stats/playersort/nhl/year-2018-season-regularseason-category-goals?print_rows=9999")
    Nokogiri::HTML(html)
  end

  def self.scrape_stats
    doc = self.get_page
    all_athlete_stat_lines = []
    stat_table = doc.css('table.data')
    
    stat_table.css('tr').each do |stats|
      athlete_stat_lines = {
        name: stats.css('td:nth-child(1)').text,
        position: stats.css('td:nth-child(2)').text,
        team: stats.css('td:nth-child(3)').text,
        games_played: stats.css('td:nth-child(4)').text,
        goals: stats.css('td:nth-child(5)').text,
        assists: stats.css('td:nth-child(6)').text,
        points: stats.css('td:nth-child(7)').text,
        plus_minus: stats.css('td:nth-child(8)').text,
        penalty_min: stats.css('td:nth-child(9)').text,
        power_play_goals: stats.css('td:nth-child(10)').text,
        short_handed_goals: stats.css('td:nth-child(11)').text,
        game_winning_goals: stats.css('td:nth-child(12)').text,
        overtime_goals: stats.css('td:nth-child(13)').text,
        shots_on_goals: stats.css('td:nth-child(14)').text,
        shooting_percentage: stats.css('td:nth-child(15)').text,
        time_on_ice_per_game: stats.css('td:nth-child(16)').text,
        average_shifts_per_game: stats.css('td:nth-child(17)').text,
        faceoff_percentage: stats.css('td:nth-child(18)').text,
        shootout_percentage: stats.css('td:nth-child(19)').text
      }

      all_athlete_stat_lines << athlete_stat_lines  
    end
  all_athlete_stat_lines.drop(2)

  end

  binding.pry
end