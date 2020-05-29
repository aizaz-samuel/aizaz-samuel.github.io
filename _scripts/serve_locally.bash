#!/bin/bash
help="no"
envsetup="no"
serve="no"
filename=""
# process command line options
if [ $# -ne 0 ]; then
   for i do
      case "$i" in
        -h | --help)    help="yes";             shift;;
        --env_setup | --env-setup | --envsetup)
                        envsetup="yes";         shift;;
        --serve | -s)   serve="yes";            shift;;
        --file | -f) filename=$2;               shift;;
        *)
           ;;
      esac
   done
else
   help="yes"
fi

if [ $help == "yes" ]; then
  echo " "
  echo " Usage: ./serve_locally.bash [OPTIONS] [FILENAME]"
  echo " "
  echo " This script will locally serve web pages using jekyll"
  echo " on your computer. It assumes you have all prerequisites"
  echo " already setup."
  echo " "
  echo "         ./serve_locally.bash -s"
  echo " "
  echo " To see how to setup the prerequisites"
  echo " "
  echo "         ./serve_locally.bash --envsetup"
  echo " "
  echo " To run custom yml configuration file"
  echo " "
  echo "         ./serve_locally.bash -s -f _custom_config.yml"
  echo " "
  echo " "
  echo " Command line arguments:"
  echo " "
  echo "    <FILENAME>"
  echo "           specify using the -f or --file switch"
  echo "           yml configuration file for site to be served"
  echo "           defaults to _config.yml"
  echo " "
  echo "    --envsetup"
  echo "           Describe how prerequisites were setup"
  echo ""
  echo "    --file, -f "
  echo "           Specify yml configuration file to be served"
  echo "           -f _config.yml"
  echo ""
  echo "    --help, -h"
  echo "           display this message"
  echo ""
  exit
fi

if [ $envsetup == "yes" ]; then
  echo "The development environment was set up on Linux Mint 19 Tara as described below"
  echo "this script has not been tested and may not work on other OS"
  echo "It is run from where you already have a gitclone of a working GitHub website"
  echo "i.e. /local/computer/path/gitusername.github.io"
  echo " "
  echo "1.  First install ruby and other dependencies"
  echo ""
  echo "         sudo apt-get install ruby-full build-essential zlib1g-dev"
  echo ""
  echo "2.  Set up gem installation directory for user (not root)"
  echo ""
  echo "         echo ' ' >> ~/.bashrc" 
  echo "         echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc"
  echo "         echo 'export GEM_HOME=\"\$HOME/gems\"' >> ~/.bashrc"
  echo "         echo 'export PATH=\"\$HOME/gems/bin:\$PATH\"' >> ~/.bashrc"
  echo "         source ~/.bashrc"
  echo ""
  echo "3.  Now install jekyll for serving and creating pages "
  echo "     and bundler for book keeping version numbers and dependencies"
  echo ""
  echo "         gem install jekyll bundler"
  echo ""
  echo "4.  Initialize environment"
  echo ""
  echo "         bundle init"
  echo "         bundle add jekyll"
  echo ""
  echo "5.  If you are using a theme from Github  in your _config.yml then it should "
  echo "    be installed e.g. as shown below. You may need to downgrade gems if "
  echo "    minimum version numbers are defined using ~> in the Gemfile"
  echo ""
  echo "         echo 'gem \"github-pages\", group: :jekyll_plugins' >> Gemfile"
  echo "         bundle install"
  echo ""
  echo "6.  You should be good to go!"
  exit
fi

if [ $serve == "yes" ]; then
  echo "serving up your pages"
  echo ""
  bundle exec jekyll serve $filename
  echo ""
fi
