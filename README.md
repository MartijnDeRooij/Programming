This is the map where I will put all my programming examples for VHDL, Python, C, C++ etc

Command line instructions
You can also upload existing files from your computer using the instructions below.


Git global setup
git config --global user.name "Martijn de Rooij"
git config --global user.email "martijn.de.rooij.1996@gmail.com"

Create a new repository
git clone git@gitlab.com:Marty_253/gitlab-commands.git
cd gitlab-commands
git switch -c main
touch README.md
git add README.md
git commit -m "add README"
git push -u origin main

Push an existing folder
cd existing_folder
git init --initial-branch=main
git remote add origin git@gitlab.com:Marty_253/gitlab-commands.git
git add .
git commit -m "Initial commit"
git push -u origin main

Push an existing Git repository
cd existing_repo
git remote rename origin old-origin
git remote add origin git@gitlab.com:Marty_253/gitlab-commands.git
git push -u origin --all
git push -u origin --tags
