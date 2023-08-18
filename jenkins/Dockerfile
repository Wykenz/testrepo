FROM liferay/jdk11

ENV TINI_VERSION v0.19.0
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini

COPY resources/usr/local/sbin/jenkins.sh /usr/local/bin/jenkins.sh

RUN groupadd -g 1001 jenkins && \
	useradd -g 1001 -d /var/lib/jenkins -u 1001 jenkins

RUN curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key > /usr/share/keyrings/jenkins-keyring.asc && \
    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list && \
    apt-get update && \
    apt install jenkins -y --no-install-recommends

RUN mkdir /var/cache/jenkins/war && \
    chown jenkins /var/cache/jenkins/war

RUN chmod +x /tini

USER jenkins

ENTRYPOINT ["/tini", "--"]

CMD [ "/usr/local/bin/jenkins.sh" ]


