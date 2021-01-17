FROM ubuntu:bionic

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install python3.6 python3.6-venv python3.6-dev python3-pip -y
RUN rm /usr/bin/python3
RUN ln -s /usr/bin/python3.6 /usr/bin/python3
RUN python3 --version
RUN apt-get install unzip -y
RUN apt install wget -y
RUN apt install git -y
RUN git clone https://github.com/karanvivekbhargava/obamanet.git
RUN apt-get -y install cmake
RUN apt update && apt install -y libsm6 libxext6
RUN apt-get install -y libxrender-dev libxrender1 libfontconfig1
RUN apt-get install -y ffmpeg
RUN pip3 install -r /obamanet/requirements.txt
RUN pip3 install h5py==2.10.0
ADD data.zip /obamanet
ADD checkpoints.zip /obamanet
RUN unzip /obamanet/data.zip -d /obamanet/
RUN unzip /obamanet/checkpoints.zip -d /obamanet/

COPY test.wav /obamanet/test.wav
COPY bootstrap.sh .

ENTRYPOINT [ "/bin/bash", "bootstrap.sh" ]

