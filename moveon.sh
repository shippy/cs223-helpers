cd ~/hw
hw_n=$(pwd -P | tail -2c)
((hw_n++))
echo $hw_n
cd ~
rm hw
mkdir ~/cs223/hw$hw_n
ln -s ~/cs223/hw$hw_n hw
