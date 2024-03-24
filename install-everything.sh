# na začátku odinstalovat Rko, pokud je nainstalované
#sudo apt purge r-base r-base-core

# install miniconda
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
source ~/.bashrc

# set libmamba as the default resolver
conda install -y -n base conda-libmamba-solver
conda config --set solver libmamba

# stained glass
conda create -y -n stainedglass -c conda-forge -c bioconda 'snakemake>=8' bioconda::samtools
sudo apt install -y git
git clone https://github.com/mrvollger/StainedGlass.git
cd StainedGlass/
git reset --hard v0.6
