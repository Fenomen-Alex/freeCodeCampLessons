#!/bin/bash

# Function to generate a random number between 1 and 1000
generate_random_number() {
    echo $(( RANDOM % 1000 + 1 ))
}

# Function to interact with the user
play_game() {
    local username="$1"
    local secret_number=$(generate_random_number)

    # Retrieve user info if exists
    local user_info=$(psql --username=freecodecamp --dbname=number_guess -t --no-align -q \
                      -c "SELECT games_played, best_game FROM users WHERE username='$username';")

    if [[ -n "$user_info" ]]; then
        local games_played=$(echo "$user_info" | awk -F '|' '{print $1}')
        local best_game=$(echo "$user_info" | awk -F '|' '{print $2}')
        echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
    else
        psql --username=freecodecamp --dbname=number_guess -q -c \
             "INSERT INTO users (username, games_played, best_game) VALUES ('$username', 0, -1);"
        echo "Welcome, $username! It looks like this is your first time here."
        games_played=0
        best_game=-1
    fi

    echo "Guess the secret number between 1 and 1000:"

    local guess
    local number_of_guesses=0

    while true; do
        read guess

        if [[ ! $guess =~ ^[0-9]+$ ]]; then
            echo "That is not an integer, guess again:"
            continue
        fi

        (( number_of_guesses++ ))

        if (( guess < secret_number )); then
            echo "It's higher than that, guess again:"
        elif (( guess > secret_number )); then
            echo "It's lower than that, guess again:"
        else
            break
        fi
    done

    echo "You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!"

    # Update games_played count
    psql --username=freecodecamp --dbname=number_guess -q -c \
         "UPDATE users SET games_played = games_played + 1 WHERE username = '$username';"

    # Update best_game if necessary
    if (( best_game == -1 || number_of_guesses < best_game )); then
        psql --username=freecodecamp --dbname=number_guess -q -c \
             "UPDATE users SET best_game = $number_of_guesses WHERE username = '$username';"
    fi
}

# Main script starts here
PSQL="psql --username=freecodecamp --dbname=number_guess"

echo "Enter your username:"
read username

if [[ ${#username} -gt 22 ]]; then
    echo "Username cannot be longer than 22 characters."
    exit 1
fi

play_game "$username"
