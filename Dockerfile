FROM hypriot/rpi-alpine:3.6

RUN apk add python3 gcc python3-dev libc-dev --no-cache

WORKDIR "/exporter"
COPY src .
RUN pip3 install adafruit-circuitpython-dht 
RUN pip3 install prometheus-client

#COPY ./fix/platform_detect.py /usr/lib/python3.6/site-packages/Adafruit_DHT/platform_detect.py

ENTRYPOINT ["python3", "exporter.py"]