FROM nvcr.io/nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update \
 && DEBIAN_FRONTEND=noninteractive apt-get -qqy install python3-pip ffmpeg git less nano libsm6 libxext6 libxrender-dev \
 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /

RUN pip3 install --upgrade pip
RUN pip3 install \
  https://download.pytorch.org/whl/cu100/torch-1.0.0-cp36-cp36m-linux_x86_64.whl \
  git+https://github.com/1adrianb/face-alignment \
  -r requirements.txt

COPY . /

CMD python3 demo.py --config config/vox-256.yaml --cpu --driving_video output.mp4 --source_image source.png --checkpoint vox-cpk.pth.tar --result_video /result.mp4 --relative --adapt_scale