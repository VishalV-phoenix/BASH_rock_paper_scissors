#!/bin/bash

echo "Welcome to a game of Rock, Paper, Scissors!"

game_loop() {
    echo
    echo "Enter your choice (rock, paper, or scissors):"
    read user_choice

    comp_num=$(( RANDOM % 3 ))

    if [[ $comp_num -eq 0 ]]; then
        comp_choice="rock"
    elif [[ $comp_num -eq 1 ]]; then
        comp_choice="paper"
    else
        comp_choice="scissors"
    fi

    echo "Computer chose: $comp_choice"

    if [[ $user_choice == $comp_choice ]]; then
        echo "It's a tie!"
    elif [[ ($user_choice == "rock" && $comp_choice == "scissors") || 
            ($user_choice == "paper" && $comp_choice == "rock") || 
            ($user_choice == "scissors" && $comp_choice == "paper") ]]; then
        echo "You win!"
    else
        echo "You lose!"
    fi
}

# Main loop
while true; do
    game_loop
    echo
    read -p "Would you like to play again? (y/n): " play
    if [[ "$play" != "y" && "$play" != "Y" ]]; then
        echo "Thank you for playing!"
        break
    fi
done
