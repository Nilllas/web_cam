FROM mohaseeb/raspberrypi3-python-opencv:latest

WORKDIR /code

ENV READTHEDOCS=True
CMD usermod -a -G video root
CMD modprobe bcm2835-v4l2

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD ["python", "main.py"]
