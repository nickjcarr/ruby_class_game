class Encounter
    # All encounters will have this data.
    attr_reader :art  # Our sweet sweet ascii art.
    attr_reader :name # The name of the encounter, duh!
    attr_reader :options # The options, the player chooses!
    attr_reader :consequences # The consequence of the players choice of options.
    attr_reader :encounter_intro # Intro for the encounter!

    def perform(player)
        print_intro(player.name)
        print_options
        players_choice = get_player_choice 
        enact_consequences_of_players_choice(players_choice, player)
    end

private 
    def print_intro(player_name)
        puts "#{player_name} encounters a #{@name}."
        puts @art
        puts @encounter_intro
    end
    def print_options()
        options_index = 0
        for option in @options
            puts "#{options_index + 1}. #{option}"
            options_index += 1
        end
    end
    def get_player_choice()
        print "Enter your choice: "
        players_choice = gets.to_i - 1 # 0->3
        puts @consequences[players_choice]

        return players_choice
    end

end