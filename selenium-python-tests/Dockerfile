FROM python:3.7.12-bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y git vim

RUN git clone --branch master --single-branch https://github.com/grnet/agora-sp.git /home/agora-sp && \
    mkdir -p /srv/agora/tests/selenium_tests && \
    cp -r /home/agora-sp/tests/selenium_tests/* /srv/agora/tests/selenium_tests/ && \
    rm -fr /home/agora-sp

WORKDIR /srv/agora/tests/selenium_tests/

RUN pip install -U pip --upgrade
RUN pip install -r requirements.txt

CMD ["pytest", "agora_unit_tests.py", "--maxfail=1", "-o junit_family=xunit2", "--junitxml=reports/junit.xml"]