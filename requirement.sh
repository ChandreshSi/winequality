yum -y install git
yum -y install docker
sudo systemctl start docker
pip3 install --upgrade pip
pip3 install numpy
pip3 install pandas
pip3 install sklearn
pip3 install pyspark==3.0.0
pip3 install findspark
export PYSPARK_PYTHON="/opt/miniconda3/bin/python"
