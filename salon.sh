#!/bin/bash

# Function to display services
display_services() {
    echo "~~~~~ MY SALON ~~~~~"
    echo
    echo "Welcome to My Salon, how can I help you?"
    echo

    # Retrieve services list from database and format it correctly
    SERVICES=$(psql --username=freecodecamp --dbname=salon -t -c "SELECT service_id, name FROM services;")

    # Check if there are services to display
    if [ -z "$SERVICES" ]; then
        echo "No services available."
    else
        # Read each line of the result and display services in a numbered list format
        while IFS='|' read -r SERVICE_ID SERVICE_NAME; do
            echo "${SERVICE_ID}) ${SERVICE_NAME}"
        done <<< "$SERVICES"
    fi

    echo
}

# Function to check if a service exists
service_exists() {
    SERVICE_ID=$1
    COUNT=$(psql --username=freecodecamp --dbname=salon -t -c "SELECT COUNT(*) FROM services WHERE service_id = $SERVICE_ID;")
    echo $COUNT
}

# Function to insert a new customer
insert_customer() {
    CUSTOMER_PHONE=$1
    CUSTOMER_NAME=$2
    psql --username=freecodecamp --dbname=salon -c "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME');"
}

# Main script

# Display available services
display_services

# Prompt for service input
while true; do
    read -p "Enter the service number you would like: " SERVICE_ID_SELECTED
    
    # Validate if service_id exists
    SERVICE_EXISTS=$(service_exists $SERVICE_ID_SELECTED)
    
    if [ "$SERVICE_EXISTS" -eq 0 ]; then
        echo "I could not find that service. Please choose from the list."
        display_services
    else
        break
    fi
done

# Prompt for phone number
read -p "What's your phone number? " CUSTOMER_PHONE

# Check if customer exists
CUSTOMER_ID=$(psql --username=freecodecamp --dbname=salon -t -c "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")

# If customer doesn't exist, prompt for name and insert into database
if [ -z "$CUSTOMER_ID" ]; then
    read -p "I don't have a record for that phone number, what's your name? " CUSTOMER_NAME
    insert_customer $CUSTOMER_PHONE "$CUSTOMER_NAME"
    CUSTOMER_ID=$(psql --username=freecodecamp --dbname=salon -t -c "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
else
    CUSTOMER_NAME=$(psql --username=freecodecamp --dbname=salon -t -c "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")
fi

# Prompt for appointment time
read -p "What time would you like your $(psql --username=freecodecamp --dbname=salon -t -c "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;"), $CUSTOMER_NAME? " SERVICE_TIME

# Insert appointment into database
psql --username=freecodecamp --dbname=salon -c "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');"

# Output confirmation message
SERVICE_NAME=$(psql --username=freecodecamp --dbname=salon -t -c "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
echo
echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
echo
