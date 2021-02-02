FROM mohaseeb/raspberrypi3-python-opencv:latest

WORKDIR /code

ENV READTHEDOCS=True
 
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD ["usermod -a -G video root"]
CMD ["modprobe bcm2835-v4l2"]
CMD ["python", "main.py"]
