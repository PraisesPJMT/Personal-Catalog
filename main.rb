require_relative 'app'

def main
  puts 'Welcome to the Personal Catalogue App!'
  @exit = false
  personal_catalog = Catalog.new
  until @exit
    personal_catalog.display_menu
    print 'Option: '
    main_response = gets.chomp
    until %w[1 2 3 4 5 6 7 8 9 10].include? main_response
      personal_catalog.invalid_entry
      personal_catalog.display_menu
      print 'Option: '
      main_response = gets.chomp
    end
    if main_response == '10'
      @exit = true
      personal_catalog.app_exit
    end
    personal_catalog.list_command(main_response) if %w[1 2 3 4 5 6].include? main_response
    personal_catalog.create_command(main_response) if %w[7 8 9].include? main_response
  end
end

main
