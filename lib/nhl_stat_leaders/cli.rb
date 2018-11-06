class NhlStatLeaders::CLI

  def call
    welcome
    main_menu
    goodbye
  end

  def main_menu
    puts "Please select from the following options by entering their corresponding numerical value"
    puts "If you wish to return to this menu at any point simply enter 'menu'"
    puts "If you wish to exit the program simply enter 'exit'"
    puts ""
    puts "1. View Stat Leaders"
    puts "2. View Team Leaders"
    puts "3. Search Player Stats"
    puts "4. Glossary"
  end

  def process_selection
    input = nil
    while input != "exit"
      input = gets.strip.to_i

      if input == 1
        #sort_stats
        #display_stats
      elsif input == 2
        #get_team_roster
        #sort_stats
        #display_stats
      elsif input == 3
        #find_player
        #display stats
      elsif input == 4
        glossary
      else
        puts "Enter 'menu' to return to the main menu or 'exit' to leave the program"
      end
    end
  end  

  def menu_options
    prompt = TTY::Prompt.new

    prompt.select("Menu") do |menu|
      menu.choice 'View NHL Stat Leaders', "nhl"
      menu.choice 'View Team Stat Leaders', "team" 
      menu.choice 'Search Player', "player"
      menu.choice 'Glossary', "glossary"
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

    prompt.select("Select team", nhl_teams) 
  end

  def display_stats
     table = Terminal::Table.new title: "NHL STAT LEADERS", headings: ["Name", "Pos", "Team", "GP", "G", "A", "PTS", "+/-", "PIM", "PPG", "SHG", "GWG", "OTG", "SOG", "S%", "FO%", "SO%", "SHFT", "TOI"], rows: NhlStatLeaders::Athlete.stat_rows.first(60)

     puts table
  end

  def glossary
    NhlStatLeaders::Scraper.scrape_glossary.each do |stat_definition|
      puts stat_definition
    end
  end

  def welcome
    puts "Welcome to Nhl Stat Leaders!"
  end
  
  def goodbye
    puts "Thank you for choosing NHL Stat Leaders as your prefered NHL stat viewer!"
  end

end