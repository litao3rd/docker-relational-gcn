# nvidia-docker

FROM nvidia/cuda:10.0-base

WORKDIR /app

RUN sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
#COPY sources.list /etc/apt/sources.list

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY get-pip.py /app
COPY requirements.txt /app
COPY relational-gcn-python.tar.gz /app
COPY docker-cmd.sh /app

RUN apt-get -y update

RUN apt-get -y   install python3.6 python3.6-dev \
                 python3-pyqt5 python3-distutils \
                 curl gcc spyder3 \
                 libblas-dev liblapack-dev gfortran

RUN update-alternatives  --install /usr/bin/python python /usr/bin/python3.6 1

COPY keras.json /root/.keras/keras.json

RUN python get-pip.py

RUN pip install -i https://pypi.doubanio.com/simple -r requirements.txt

RUN tar -zxvf relational-gcn-python.tar.gz && cd relational-gcn-python3 && python setup.py install

CMD ["/bin/bash", "docker-cmd.sh"]
