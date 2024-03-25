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
