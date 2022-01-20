PYTHON_ROOT="/usr/local/lib/"
LATEST_PYTHON_PATH=`ls -d ${PYTHON_ROOT}python* |tail -n1`;
LATEST_PYTHON="${LATEST_PYTHON_PATH/${PYTHON_ROOT}/""}"    
python_version="${LATEST_PYTHON/n/"n="}"    

echo $LATEST_PYTHON_PATH
echo $LATEST_PYTHON
echo $python_version

CONDA_ROOT="/usr/local/bin/"
if [ ! -f $CONDA_ROOT"/conda"  ]; then
echo "Installing packages for the activity"
export PYTHONPATH=""
MINICONDA_INSTALLER_SCRIPT=Miniconda3-latest-Linux-x86_64.sh
MINICONDA_PREFIX=/usr/local
wget https://repo.continuum.io/miniconda/$MINICONDA_INSTALLER_SCRIPT#&>log
chmod +x $MINICONDA_INSTALLER_SCRIPT
./$MINICONDA_INSTALLER_SCRIPT -b -f -p $MINICONDA_PREFIX#&>log
conda install --channel defaults conda python_version --yes#&>log
conda update --channel defaults --all --yes#&>log
#conda install -c conda-forge kwant &>log
fi
export PYTHONPATH=$PYTHONPATH:"${LATEST_PYTHON_PATH}site-packages"
echo "All requested packages already installed.
