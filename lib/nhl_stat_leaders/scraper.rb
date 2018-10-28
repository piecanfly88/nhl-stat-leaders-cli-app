class NhlStatLeaders::Scraper

  def self.scrape_stats
    doc = Nokogiri::HTML(open("https://www.cbssports.com/nhl/stats/playersort/nhl/year-2018-season-regularseason-category-goals?print_rows=9999"))
    all_athlete_stat_lines = []
    stat_table = doc.css('table.data')
    
    stat_table.css('tr').each do |stats|
      athlete_stat_lines = {
        name: stats.css('td:nth-child(1)').text,
        position: stats.css('td:nth-child(2)').text,
        team: stats.css('td:nth-child(3)').text,
        games_played: stats.css('td:nth-child(4)').text.to_i,
        goals: stats.css('td:nth-child(5)').text.to_i,
        assists: stats.css('td:nth-child(6)').text.to_i,
        points: stats.css('td:nth-child(7)').text.to_i,
        plus_minus: stats.css('td:nth-child(8)').text.to_i,
        penalty_min: stats.css('td:nth-child(9)').text.to_i,
        power_play_goals: stats.css('td:nth-child(10)').text.to_i,
        short_handed_goals: stats.css('td:nth-child(11)').text.to_i,
        game_winning_goals: stats.css('td:nth-child(12)').text.to_i,
        overtime_goals: stats.css('td:nth-child(13)').text.to_i,
        shots_on_goal: stats.css('td:nth-child(14)').text.to_i,
        shooting_percentage: stats.css('td:nth-child(15)').text.to_f,
        time_on_ice_per_game: stats.css('td:nth-child(16)').text.sub(":", ".").to_f,
        average_shifts_per_game: stats.css('td:nth-child(17)').text.to_f,
        faceoff_percentage: stats.css('td:nth-child(18)').text.to_f,
        shootout_percentage: stats.css('td:nth-child(19)').text.to_f
      }
      
      all_athlete_stat_lines << athlete_stat_lines  
    end

  all_athlete_stat_lines[2..-2]
  end

  def self.scrape_glossary
    glossary = []
    doc = Nokogiri::HTML(open("https://www.cbssports.com/help/glossary/stats/hockey"))

    gloss = doc.css("div #layoutRailRight").each do |stat|
      definitions = [
        stat.search('b')[2].text + " - " + stat.search('i')[1].text,
        stat.search('b')[3].text + " - " + stat.search('i')[2].text,
        stat.search('b')[4].text + " - " + stat.search('i')[3].text,
        stat.search('b')[5].text + " - " + stat.search('i')[4].text,
        stat.search('b')[6].text + " - " + stat.search('i')[5].text,
        stat.search('b')[7].text + " - " + stat.search('i')[6].text,
        stat.search('b')[8].text + " - " + stat.search('i')[7].text,
        stat.search('b')[9].text + " - " + stat.search('i')[8].text,
        stat.search('b')[10].text + " - " + stat.search('i')[9].text,
        stat.search('b')[12].text + " - " + stat.search('i')[11].text,
        stat.search('b')[14].text + " - " + stat.search('i')[13].text,
        stat.search('b')[15].text + " - " + stat.search('i')[14].text,
        stat.search('b')[28].text + " - " + stat.search('i')[27].text,
        stat.search('b')[29].text + " - " + stat.search('i')[28].text
      ]

      glossary << definitions
    end

    glossary
  end

end