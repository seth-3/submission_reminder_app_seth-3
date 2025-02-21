#!/bin/bash

# Prompt for user's name
read -p "Enter your name: " User

# Define main directory
sb_dir="submission_reminder_${User}"

# Create directory structure
mkdir -p "$sb_dir/config"
mkdir -p "$sb_dir/modules"
mkdir -p "$sb_dir/app"
mkdir -p "$sb_dir/assets"

# Create necessary files
touch "$sb_dir/config/config.env"
touch "$sb_dir/assets/submissions.txt"
touch "$sb_dir/app/reminder.sh"
touch "$sb_dir/modules/functions.sh"
touch "$sb_dir/startup.sh"


# Populate config.env
cat << EOF > "$sb_dir/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# Populate submissions.txt with sample student records
cat << EOF > "$sb_dir/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Tedy, Shell Navigation, not submitted
Tont, Shell Navigation, not submitted
Kenny, Shell Navigation, not submitted
Tito, Shell Navigation, not submitted
Lydivine, Shell Navigation, submitted
EOF

# Populate functions.sh
cat << 'EOF' > "$sb_dir/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF

# Populate reminder.sh
cat << 'EOF' > "$sb_dir/app/reminder.sh"
#!/bin/bash
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

# Populate startup.sh
cat << 'EOF' > "$sb_dir/startup.sh"
#!/bin/bash
echo "Starting Submission Reminder App..."
./app/reminder.sh
EOF

# Make scripts executable
chmod +x "$sb_dir/modules/functions.sh"
chmod +x "$sb_dir/startup.sh"
chmod +x "$sb_dir/app/reminder.sh"
