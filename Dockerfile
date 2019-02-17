FROM python:3.6-slim
LABEL maintainer="Femi Oladele <profemzy@gmail.com>"

RUN apt-get update && apt-get install -qq -y \
  build-essential libpq-dev --no-install-recommends

WORKDIR /usr/src/app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD gunicorn -c "python:config.gunicorn" "dynamo.app:create_app()"