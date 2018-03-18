1. move config file to repo directory
2. add command to script with simlinks:
       [sudo] ln -sf $basedir/%filename %target_path/%filename
3. run simlink script or issue ln command
4. commit



* .bashrc
  if [ -f ~/.bash_profile ]; then
      . ~/.bash_profile
  fi



* install texlive
  https://tex.stackexchange.com/questions/1092/how-to-install-vanilla-texlive-on-debian-or-ubuntu
