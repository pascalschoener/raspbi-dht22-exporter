FROM hypriot/rpi-alpine:3.6

RUN apk add python3 gcc python3-dev libc-dev --no-cache

WORKDIR "/exporter"
COPY src .
COPY requirements.txt .
RUN pip3 install -r requirements.txt

COPY ./fix/platform_detect.py /usr/local/lib/python3.7/dist-packages/Adafruit_DHT/platform_detect.py

RUN cat /proc/cpuinfo
RUN cat /usr/local/lib/python3.7/dist-packages/Adafruit_DHT/platform_detect.py

#ENTRYPOINT [ "/bin/bash" ]
#ENTRYPOINT ["python3", "exporter.py"]