class NhlStatLeaders::Athlete
  attr_accessor :name, :position, :team, :games_played, :goals, :assists, :points, :plus_minus, :penalty_min, :power_play_goals, :short_handed_goals, :game_winning_goals, :overtime_goals, :shots_on_goal, :shooting_percentage, :faceoff_percentage, :shootout_percentage, :time_on_ice_per_game, :average_shifts_per_game

  @@all = []

  @@stat_lines = []

  def initialize(athlete_stat_lines)
    athlete_stat_lines.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_stat_lines
    NhlStatLeaders::Scraper.scrape_stats.each {|player| self.new(player)}
  end

  def self.all
    @@all
  end

  def self.stat_lines
    @@stat_lines
  end

  def self.destroy_all
    @@stat_lines.clear
  end

  def self.get_team(requested_team)
    user_team = NhlStatLeaders::Athlete.all.select {|player| player.team == requested_team}
    @@stat_lines = user_team
  end

  def self.get_player(requested_player)
    user_player = self.all.select {|player| player.name == requested_player}
    @@stat_lines = user_player
  end

  def self.sort_stat(requested_stat)
    sorted_stats = self.stat_lines.sort_by(&requested_stat.to_sym).reverse
    @@stat_lines = sorted_stats 
  end

  def self.stat_rows
    rows = []
    self.stat_lines.each do |player|
      rows << :separator
      rows << [player.name, player.position, player.team, player.games_played, player.goals, player.assists, player.points, player.plus_minus, player.penalty_min, player.power_play_goals, player.short_handed_goals, player.game_winning_goals, player.overtime_goals, player.shots_on_goal, player.shooting_percentage,  player.faceoff_percentage, player.shootout_percentage, player.average_shifts_per_game, player.time_on_ice_per_game]    
    end

    rows.delete_at(-1)
    rows
  end

end