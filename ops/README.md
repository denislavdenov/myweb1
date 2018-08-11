

# rbenv

brew install rbenv

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile

source ~/.bash_profile

rbenv init

# pre-req

rbenv

rbenv install 2.3.1

rbenv local 2.3.1

rbenv versions

gem install bundler

bundle install


# how to test

kitchen converge

kitchen verify

kitchen destroy

# how to test all automated

kitchen test

