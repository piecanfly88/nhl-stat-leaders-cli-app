class NhlStatLeaders::Scraper

  def self.get_page
    html = open("https://www.cbssports.com/nhl/stats/playersort/nhl/year-2018-season-regularseason-category-goals")
    Nokogiri::HTML(html)
  end

  def self.scrape_stats
    doc = self.get_page
    all_athlete_stat_lines = []
    stat_table = doc.css('table.data')
    athlete_stat_line = {}
    #scrape every athletes stats using .each into athlete_stat_line object then push into all_athlete_stat_lines array
  end
end