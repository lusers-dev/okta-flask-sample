# Base image 
FROM amazonlinux:latest 

COPY sample_docker_requirements.txt requirements.txt

RUN dnf install python3-pip -y --allowerasing \
    && pip3 install -r requirements.txt

WORKDIR /app
COPY . .
ENTRYPOINT [ "python3", "-m", "flask", "run", "--host=0.0.0.0" ]

