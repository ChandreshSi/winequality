#!/bin/bash

FROM amazoncorretto:8

RUN yum -y update 
RUN yum -y install yum-utils

RUN yum -y list python3*
RUN yum -y install python3 python3-dev python3-pip python3-virtualenv

RUN python -V
RUN python3 -V

ENV PYSPARK_DRIVER_PYTHON python3
ENV PYSPARK_PYTHON python3

RUN pip3 install --upgrade pip
RUN pip3 install numpy
RUN pip3 install pandas
RUN pip3 install sklearn
RUN pip3 install pyspark
RUN pip3 install findspark
RUN pip3 install boto3

RUN python3 -c "import numpy as np"

ENV PROG_DIR /winepredict
COPY test.py /winepredict/
COPY ValidationDataset.csv /winepredict/
COPY trainingmodel.model /winepredict/
COPY .aws /home/

ENV PROG_NAME test.py
ADD ${PROG_NAME} .

ENTRYPOINT ["spark-submit","test.py"]
CMD ["/winepredict/ValidationDataset.csv"]
