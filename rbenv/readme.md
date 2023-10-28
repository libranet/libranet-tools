https://www.liquidweb.com/kb/install-ruby-on-rails-almalinux/


Step 2: Clone rbenv and Set PATH
To clone rbenv with git and set PATH variables, execute the below commands:

~]# git clone https://github.com/rbenv/rbenv.git .rbenv
~]# echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
~]# echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
