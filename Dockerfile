FROM mohaseeb/raspberrypi3-python-opencv:latest

WORKDIR /code

ENV READTHEDOCS=True
 
COPY . .

RUN apt-get update \
    && apt-get upgrade -y \
    && pip install --no-cache-dir -U pip wheel setuptools \
    && pip install --no-cache-dir -r requirements.txt \

#RUN pip install -r /code/requirements.txt

CMD ["usermod -a -G video root"]
CMD ["modprobe bcm2835-v4l2"]
CMD ["python", "main.py"]
