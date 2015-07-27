#python-api dockerfile
FROM ubuntu:14.04

RUN apt-get update; apt-get -y install libxml2 libxml2-dev python-lxml libxslt-dev memcached libmemcached-dev build-essential python-dev gfortran libopenblas-dev liblapack-dev python-numpy python-setuptools python-scipy python-pip python-virtualenv git libboost-program-options-dev poppler-utils zlib1g-dev libssl-dev libyaml-dev libffi-dev

RUN sudo apt-get install libev-dev

RUN easy_install -U Sphinx
RUN easy_install cython
RUN easy_install -U distribute

#pip requirements
RUN pip install numpy
RUN git clone git://github.com/bustleandflurry/bottle-api-json-formatting.git; cd bottle-api-json-formatting/; python setup.py install; cd ..; rm -rf bottle-api-json-formatting
ADD requirements.txt /requirements.txt
RUN pip install -r /requirements.txt