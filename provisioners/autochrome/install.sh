
sudo apt install -y ruby

cd /tmp
git clone https://github.com/nccgroup/autochrome.git
cd autochrome
rm -rf ~/.config/autochrome/
sudo -H -u vagrant ruby autochrome.rb
