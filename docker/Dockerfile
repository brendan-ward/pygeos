# from: https://pythonspeed.com/articles/activate-conda-dockerfile/
FROM continuumio/miniconda3

WORKDIR /app

RUN apt-get update && apt-get install -y build-essential gdb


# Create the environment:
COPY ./environment.yml .
RUN conda env create -f environment.yml

# # Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "pygeos", "/bin/bash", "-c"]



