FROM alpine:edge

WORKDIR /app

COPY . /app

RUN apk add --no-cache python3 py3-pip \
python3 -m venv /opt/venv \
pip install Flask \
apk cache clean

ENV PATH="/opt/venv/bin:$PATH"

EXPOSE 5000

CMD [ "python3", "app.py" ]
