FROM jupyter/scipy-notebook:latest

USER root

RUN conda install --yes gcc
COPY ./docker/explore/requirements.txt /home/jovyan/requirements.txt
RUN while read requirement; do conda install --yes $requirement; done < requirements.txt
COPY ./docker/explore/pip_packages.txt /home/jovyan/pip_packages.txt
RUN pip install -r /home/jovyan/pip_packages.txt

ENV PYTHONPATH /home/jovyan/work:$PYTHONPATH
ENV GRANT_SUDO yes
ENV GOOGLE_APPLICATION_CREDENTIALS /home/jovyan/work/bigquery_credentials.dat

COPY ./docker/explore/ipython_config.py /home/jovyan/.ipython/profile_default/ipython_config.py
COPY ./docker/explore/custom.css /home/jovyan/.jupyter/custom/custom.css
# COPY ./docker/explore/jupyter_notebook_config.py /home/jovyan/.jupyter/jupyter_notebook_config.py

RUN chown -R jovyan:users /home/jovyan

USER 1000