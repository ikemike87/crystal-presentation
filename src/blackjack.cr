module Blackjack
    VERSION = "0.1.0"

    def draw_card(hand, deck)
        hand << deck[deck.size - 1]
        deck.pop()
    end

    def calculate_score(cards)
        score = 0
        has_ace = false

        cards.each {|card|
            begin
                card_value = card.to_i()
                score += card_value
            rescue exception
                if card == "A"
                    has_ace = true
                else
                    score += 10
                end
            end
        }

        if has_ace == true
            if (score + 11) > 21
                score += 1
            else
                score += 11
            end
        end

        score
    end

    def print_status(player_cards, dealer_cards)
        puts "\n"
        puts "Player's total is #{calculate_score(player_cards)}:\n"
        player_cards.each {|card|
            puts "#{card}, "
        }

        puts "\n"

        puts "Dealer's total is #{calculate_score(dealer_cards)}:\n"
        dealer_cards.each {|card|
            puts "#{card}, "
        }
        puts "\n"
    end
end

include Blackjack

deck = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
player_cards = [] of String
dealer_cards = [] of String

shuffled_deck = deck.shuffle()

draw_card dealer_cards, shuffled_deck
draw_card(player_cards, shuffled_deck)
draw_card(player_cards, shuffled_deck)
print_status(player_cards, dealer_cards)

while true
    puts "Do you want to (H)it, (S)tay, or (Q)uit?\n"
    user_input = gets

    exit if user_input.nil?

    default_user_input = "Q"

    user_input = user_input.presence || default_user_input

    user_input = user_input.upcase()

    if user_input == "H"
        draw_card(player_cards, shuffled_deck)
        print_status(player_cards, dealer_cards)

        if calculate_score(player_cards) > 21
            puts "You Busted! You Lose!\n"
            exit
        end
    elsif user_input == "S"
        break
    elsif user_input == "Q"
        exit
    end
end

puts "Dealer draws rest of cards.\n"

while calculate_score(dealer_cards) < 17
    draw_card(dealer_cards, shuffled_deck)
end
print_status(player_cards, dealer_cards)

if calculate_score(dealer_cards) > 21
    puts "Dealer busts! You win!\n"
elsif calculate_score(dealer_cards) > calculate_score(player_cards)
    puts "Dealer wins!\n"
elsif calculate_score(dealer_cards) < calculate_score(player_cards)
    puts "You Win!\n"
else
    puts "It's a tie!\n"
end