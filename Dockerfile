FROM dymat/opencv:arm32v7

WORKDIR /code

ENV READTHEDOCS=True

RUN apt-get update \
    && apt-get upgrade -y

RUN pip install --no-cache-dir -U pip wheel setuptools 
RUN pip install --no-cache-dir -r requirements.txt 

COPY . .

CMD ["usermod -a -G video root"]
CMD ["modprobe bcm2835-v4l2"]
CMD ["python", "main.py"]
