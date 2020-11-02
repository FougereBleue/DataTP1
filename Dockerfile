FROM ubuntu

WORKDIR /usr/src/app

COPY . .

RUN apt-get update -y \ 
    && apt-get install -y python3 \ 
    && apt-get install -y python3-pip \
    && apt-get install -y vim \
    && apt-get install -y git \
    && pip3 install --upgrade pip \
    && pip3 install -r requirements.txt \
    && git config --global user.name Test \
    && git config --global user.email Test@gmail.com

RUN git clone https://github.com/FougereBleue/Docker.git

EXPOSE 8000

CMD ["jupyter", "notebook", "--port=8000", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
