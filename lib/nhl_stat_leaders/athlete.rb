class NhlStatLeaders::Athlete
  attr_accessor :name, :position, :team, :gp, :goals, :assists, :points, :plus_minus #etc...

  @@all = []

  def initialize(athlete_stat_lines)
    athlete_stat_lines.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_stat_lines(athlete_stat_lines)
    athlete_stat_lines.each{|player| Self.new(player)}
  end

  def self.all
    @@all
  end
  
end