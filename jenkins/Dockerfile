FROM liferay/jdk11

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

COPY resources/usr/local/sbin/jenkins.sh /usr/local/bin/jenkins.sh

RUN curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key > /usr/share/keyrings/jenkins-keyring.asc && \
    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list && \
    apt-get update

RUN apt install jenkins -y --no-install-recommends

RUN mkdir /var/cache/jenkins/war && \
    chown jenkins /var/cache/jenkins/war

USER jenkins

CMD [ "/usr/local/bin/jenkins.sh" ]
