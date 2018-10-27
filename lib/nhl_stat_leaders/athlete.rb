class NhlStatLeaders::Athlete
  attr_accessor :name, :position, :team, :games_played, :goals, :assists, :points, :plus_minus, :penalty_min, :power_play_goals, :short_handed_goals, :game_winning_goals, :overtime_goals, :shots_on_goal, :shooting_percentage, :time_on_ice_per_game, :average_shifts_per_game, :faceoff_percentage, :shootout_percentage

  @@all = []

  def initialize(athlete_stat_lines)
    athlete_stat_lines.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_stat_lines
    destroy_all
    NhlStatLeaders::Scraper.scrape_stats.each {|player| self.new(player)}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.get_team
    requested_team = gets.strip
    user_team = @@all.select {|player| player.team == requested_team}
    @@all = user_team
  end

end