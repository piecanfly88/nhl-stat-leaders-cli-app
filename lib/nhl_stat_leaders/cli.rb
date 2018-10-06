class NhlStatLeaders::CLI

  def call
    welcome
    main_menu
    goodbye
  end

  def main_menu
    puts "Please select from the following options"
    puts "1. View leaders by stat"
    puts "2. View leaders by team"
    puts "3. Search Player"
    puts "4. Glossary"
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