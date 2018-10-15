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


  def glossary
    puts "list NHL stats and their descriptions"
  end
  def welcome
    puts "Welcome to Nhl Stat Leaders!"
  end
  
  def goodbye
    puts "Thank you for choosing NHL Stat Leaders as your prefered NHL stat viewer!"
  end

end