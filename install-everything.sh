# na začátku odinstalovat Rko, pokud je nainstalované
#sudo apt purge r-base r-base-core

cd ~

# install miniconda
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-py312_24.1.2-0-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
source ~/.bashrc

# set libmamba as the default resolver
conda install -y -n base conda-libmamba-solver=23.12.0
conda config --set solver libmamba

# stained glass
conda create -y -n stainedglass -c conda-forge -c bioconda snakemake=8.10.0 bioconda::samtools=1.19.2
sudo apt install -y git
git clone https://github.com/mrvollger/StainedGlass.git
cd StainedGlass/
git reset --hard v0.6
cd ~

# repeat observer
conda create -y -n repeatobserver -c conda-forge -c bioconda r-base=4.3.1 bioconda::seqkit=2.8.0 bioconda::emboss=6.6.0 conda-forge::r-devtools=2.4.5 conda-forge::dos2unix=7.4.1
conda activate repeatobserver
Rscript -e "library(devtools)" -e "install_github(\"celphin/RepeatOBserverV1@465eec078d1ebb5ccdea5b354ab3e283c9937f95\")"
mkdir -p ~/repeatobserver
wget https://raw.githubusercontent.com/celphin/RepeatOBserverV1/main/Setup_Run_Repeats.sh -O ~/repeatobserver/Setup_Run_Repeats.sh
dos2unix ~/repeatobserver/Setup_Run_Repeats.sh
chmod +x ~/repeatobserver/Setup_Run_Repeats.sh

# trash
conda create -y -n trash -c conda-forge -c bioconda r-base=4.1.3 zlib
conda activate trash
git clone https://github.com/vlothec/TRASH
cd TRASH/
git reset --hard cc39f01bd9be1f4bfe37f5f737a2f16dcb60e8b9
chmod +x TRASH_install.sh
./TRASH_install.sh
cd ~
