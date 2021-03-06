export password="123456"
export home="/home/username"
export paraviewVersion="5.8" # Find Paraview version on https://www.paraview.org/download/ 
export paraviewVersionName="5.8.0-MPI-Linux-Python3.7-64bit"
export useremail="user@mail" # Git Hub user mail
export username="username" # Git Hub user name

./sh/essential.sh ${password} # Essential (at least for me) softwares
./sh/sublime3.sh # Sublime3 configuration
./sh/libs.sh ${password} # Boost, Eigen3, HDF5, FEniCS, among others
./sh/utilities.sh ${password} # Browser, office, image editors, etc

python3 ./py/dropbox.py ${password} ${home} # Dropbox
python3 ./py/skype.py ${password} ${home} # Skype
python3 ./py/paraview.py ${password} ${home} ${paraviewVersion} ${paraviewVersionName} # Paraview
python3 ./py/mendeley.py ${password} ${home} # Mendeley
python3 ./py/multiphenics.py ${home} # Multiphenics
python3 ./py/rbnics.py ${home} # RBniCS

./sh/git.sh ${useremail} ${username} # Git configuration
cp -r .bash_aliases $HOME/ # Copy aliases
source ~/.bashrc # Initialize aliases
updt # Fix broken packages
timedatectl set-local-rtc 1 --adjust-system-clock # Fix Ubuntu/Windows time difference (dual boot)