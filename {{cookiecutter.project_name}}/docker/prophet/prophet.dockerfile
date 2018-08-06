FROM python:3.6

ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    python3-dev \
    gcc \
    python-pip vim-tiny \
    && rm -rf /var/lib/apt/lists/*

# These can be in requirements.txt, but keeping them separate for now
# so don't have to rebuild earlier images when upgrading packages
RUN pip install --upgrade pandas numpy scipy scikit-learn statsmodels fbprophet
RUN pip install --upgrade pip seaborn openpyxl pyyaml jupyter xlrd
RUN pip install --upgrade psycopg2-binary

RUN mkdir -p /usr/src

ENV PYTHONPATH /usr/src:$PYTHONPATH

EXPOSE 8888

WORKDIR /usr/src
