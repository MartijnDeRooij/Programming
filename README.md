This is the map where I will put all my programming examples for VHDL, Python, C, C++ etc

Command line instructions
You can also upload existing files from your computer using the instructions below.


Git global setup
git config --global user.name "Marty"
git config --global user.email "EMAIL"

Create a new repository
git clone https://github.com/Marty253/Programming.git
cd gitlab-commands
git switch -c main
touch README.md
git add README.md
git commit -m "add README"
git push -u origin main

Push an existing folder
cd existing_folder
git init --initial-branch=main
git remote add origin https://github.com/Marty253/Programming.git
git add .
git commit -m "Initial commit"
git push -u origin main

Push an existing Git repository
cd existing_repo
git remote rename origin old-origin
git remote add origin https://github.com/Marty253/Programming.git
git push -u origin --all
git push -u origin --tags
