PYTHON_ROOT="/usr/local/lib/"
LATEST_PYTHON_PATH=`ls -d ${PYTHON_ROOT}python* |tail -n1`;
LATEST_PYTHON="${LATEST_PYTHON_PATH/${PYTHON_ROOT}/""}"    
python_version="${LATEST_PYTHON/n/"n="}"    

CONDA_ROOT="/usr/local/bin/"
if [ ! -f $CONDA_ROOT"/conda"  ]; then
echo "Installing packages for the activity"
export PYTHONPATH=""
MINICONDA_INSTALLER_SCRIPT=Miniconda3-latest-Linux-x86_64.sh
MINICONDA_PREFIX=/usr/local
wget https://repo.continuum.io/miniconda/$MINICONDA_INSTALLER_SCRIPT>log
chmod +x $MINICONDA_INSTALLER_SCRIPT
./$MINICONDA_INSTALLER_SCRIPT -b -f -p $MINICONDA_PREFIX>log
conda install --channel defaults conda python_version --yes>log
conda update --channel defaults --all --yes#&>log
fi
export PYTHONPATH=$PYTHONPATH:"${LATEST_PYTHON_PATH}site-packages"
conda install -c conda-forge kwant 
conda install -c conda-forge qsymm
conda install -c conda-forge sympy

#Add a path to the content
ln -s LATEST_PYTHON_PATH/site-packages /content/conda_dir
echo ${LATEST_PYTHON_PATH}/site-packages
echo "All requested packages already installed."
