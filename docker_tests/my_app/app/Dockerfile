FROM alpine:edge

WORKDIR /app

COPY . /app

ENV PATH="/opt/venv/bin:$PATH"

RUN apk add --no-cache python3 py3-pip 
RUN python3 -m venv /opt/venv
RUN pip install Flask
RUN apk cache clean


EXPOSE 5000

CMD [ "python3", "app.py" ]
