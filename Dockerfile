FROM dymat/opencv:arm32v7

ENV READTHEDOCS=True

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y python-pip

RUN set -x 

RUN pip install --upgrade "pip < 21.0"
RUN pip install setuptools wheel

WORKDIR /code
ADD . /code

RUN pip install -r ./requirements.txt

CMD ["usermod -a -G video root"]
CMD ["modprobe bcm2835-v4l2"]
CMD ["python", "main.py"]
