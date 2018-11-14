class NhlStatLeaders::CLI

  def call
    NhlStatLeaders::Athlete.create_stat_lines
    welcome
    main_menu
    goodbye
  end

  def main_menu
    NhlStatLeaders::Athlete.load_all_players
    user_selection = menu_options

    if user_selection == "nhl"
      nhl_leaders_logic
    elsif user_selection == "team"
      NhlStatLeaders::Athlete.get_team(select_team)
      team_leaders_logic
    elsif user_selection == "glossary"
      glossary
    elsif user_selection == "exit"
      goodbye
    end
    main_menu
  end

  def nhl_leaders_logic
    NhlStatLeaders::Athlete.sort_stats(select_stat)
    display_stats
    user_selection = nhl_leaders_menu

    if user_selection == 'stats'
      nhl_leaders_logic
    elsif user_selection == 'back_menu'
      main_menu
    end
  end

  def team_leaders_logic
    NhlStatLeaders::Athlete.sort_stats(select_stat)
    display_stats
    user_selection = team_leaders_menu

    if user_selection == 'stat'
      team_leaders_logic
    elsif user_selection == 'change'
      NhlStatLeaders::Athlete.get_team(select_team)
    elsif user_selection == 'menu'
      main_menu
    end
    team_leaders_logic
  end

  def menu_options
    prompt = TTY::Prompt.new

    prompt.select("MAIN MENU:") do |menu|
      menu.choice 'View NHL Stat Leaders', "nhl"
      menu.choice 'View Team Stat Leaders', "team" 
      menu.choice 'View Stat Glossary', "glossary"
      menu.choice 'Exit', "exit"  
    end
  end

  def select_team
    prompt = TTY::Prompt.new

    nhl_teams = {
      'Anaheim Ducks' => 'ANA', 'Boston Bruins' => 'BOS',
      'Arizona Coyotes' => 'ARI', 'Buffalo Sabres' => 'BUF',
      'Calgary Flames' => 'CGY', 'Carolina Hurricanes' => 'CAR',
      'Chicago Blackhawks' => 'CHI', 'Colorado Avalanche' => 'COL',
      'Columbus Blue Jackets' => 'CLB', 'Dallas Stars' => 'DAL',
      'Detroit Red Wings' => 'DET', 'Edmonton Oilers' => 'EDM',
      'Florida Panthers' => 'FLA', 'Los Angeles Kings' => 'LA',
      'Minnesota Wild' => 'MIN', 'Montreal Canadiens' => 'MON',
      'Nashville Predators' => 'NSH', 'New Jersey Devils' => 'NJ',
      'New York Islanders' => 'NYI', 'New York Rangers' => 'NYR',
      'Ottawa Senators' => 'OTT', 'Philadelphia Flyers' => 'PHI',
      'Pittsburgh Penguins' => 'PIT', 'San Jose Sharks' => 'SJ',
      'St Louis Blues' => 'STL', 'Tampa Bay Lightning' => 'TB',
      'Toronto Maple Leafs' => 'TOR', 'Vancouver Canucks' => 'VAN',
      'Vegas Golden Knights' => 'LV', 'Washington Capitals' => 'WAS',
      'Winnipeg Jets' => 'WPG'
    }

    prompt.select("SELECT NHL TEAM:", nhl_teams) 
  end

  def team_leaders_menu
    prompt = TTY::Prompt.new

    prompt.select("SELECT WHAT'S NEXT:") do |menu|
      menu.choice 'Select Stat', 'stat' 
      menu.choice 'Change Team', 'change' 
      menu.choice 'Menu', 'menu'
    end
  end

  def select_stat
    prompt = TTY::Prompt.new

    stats = {
      'GP' => 'games_played', 'G' => 'goals', 'A' => 'assists', 
      'PTS' => 'points', '+/-' => 'plus_minus', 'PIM' => 'penalty_min',
      'PPG' => 'power_play_goals', 'SHG' => 'short_handed_goals',  
      'GWG' => 'game_winning_goals', 'OTG' => 'overtime_goals', 
      'SOG' => 'shots_on_goal', 'S%' => 'shooting_percentage',  
      'FO%' => 'faceoff_percentage', 'SO%' => 'shootout_percentage', 
      'SHFT' => 'average_shifts_per_game', 'TOI' => 'time_on_ice_per_game'
    }

    prompt.select('SELECT NHL OFFENSIVE STAT:', stats)
  end

  def nhl_leaders_menu
    prompt = TTY::Prompt.new
    prompt.select("SELECT WHAT'S NEXT:") do |menu|
      menu.choice 'Select Another Stat', "stats"
      menu.choice 'Main Menu', "back_menu"
    end
  end

  def display_stats
    table = Terminal::Table.new title: "NHL STAT LEADERS", 
    headings: ["Name", "Pos", "Team", "GP", "G", "A", "PTS", "+/-", "PIM", "PPG", "SHG", "GWG", "OTG", "SOG", "S%", "FO%", "SO%", "SHFT", "TOI"],
    rows: NhlStatLeaders::Athlete.stat_rows.first(60)

    puts ""
    puts table
    puts ""
  end


  def glossary
    puts ""
    NhlStatLeaders::Scraper.scrape_glossary.each do |stat_definition|
      puts stat_definition
    end
    puts ""
  end

  def welcome
    puts ""
    puts "Welcome to Nhl Stat Leaders!"
    puts ""
  end
  
  def goodbye
    puts ""
    puts "Thank you for choosing NHL Stat Leaders as your prefered NHL stat viewer!"
    exit
  end

end