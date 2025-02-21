#!/bin/bash
Submission Reminder App

Description

The Submission Reminder App is a shell script-based application that helps manage student submissions for assignments. The application checks whether students have submitted their assignments and sends reminders for those who haven't.
This repository contains the shell script to set up the application environment, the necessary files, and logic for checking submissions and sending reminders.

Setup and Usage

Follow these steps to set up and run the Submission Reminder App on your system:

1. Clone the Repository
Clone the repository to your local machine by running the following command:
bash

git clone https://github.com/yourusername/submission_reminder_app_yourusername.git
cd submission_reminder_app_yourusername

2. Make the create_environment.sh Script Executable
The create_environment.sh script will create the directory structure and necessary files for the application.
Make the script executable by running:
bash

chmod +x create_environment.sh

3. Run the Setup Script
Now, run the setup script to create the directory structure and populate the files:
bash

./create_environment.sh

The script will prompt you for your name. It will then create a directory called submission_reminder_{yourName}, where {yourName} is replaced by the name you enter. The script will also create the following directory structure:

plaintext


submission_reminder_{yourName}/
├── config/
│   └── config.env
├── modules/
│   └── functions.sh
├── app/
│   └── reminder.sh
├── assets/
│   └── submissions.txt
└── startup.sh

The necessary files (config.env, functions.sh, reminder.sh, submissions.txt, and startup.sh) will be populated with their respective contents.
4. Make the Scripts Executable
After the directories and files are created, make the scripts executable:
bash

chmod +x submission_reminder_{yourName}/modules/functions.sh
chmod +x submission_reminder_{yourName}/app/reminder.sh
chmod +x submission_reminder_{yourName}/startup.sh

5. Run the Application
To start the Submission Reminder App, execute the startup.sh script:
bash

./submission_reminder_{yourName}/startup.sh

This will start the reminder process and output a list of students who have not submitted the assignment.
Directory Structure
The following is the structure of the application after running the setup script:
plaintext


submission_reminder_{yourName}/
├── config/
│   └── config.env          # Configuration file for assignment details
├── modules/
│   └── functions.sh        # Functions to check submissions and send reminders
├── app/
│   └── reminder.sh         # Script that runs the reminder process
├── assets/
│   └── submissions.txt     # List of students' submission statuses
└── startup.sh              # Startup script to initialize the reminder app


