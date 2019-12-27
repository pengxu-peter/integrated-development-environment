FROM harbor.do.proxima-ai.com/alpha/alpha-deploy:1.3


#添加jdk环境 wget  https://download.java.net/java/ga/jdk11/openjdk-11_linux-x64_bin.tar.gz
COPY openjdk-11_linux-x64_bin.tar.gz /usr/lib/jvm/openjdk-11_linux-x64_bin.tar.gz
RUN cd /usr/lib/jvm \
&& tar -xzvf openjdk-11_linux-x64_bin.tar.gz \
&& rm -rf openjdk-11_linux-x64_bin.tar.gz

# Set time zone
RUN  ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& echo "Asia/Shanghai" > /etc/timezone

# Set environment
ENV JAVA_HOME /usr/lib/jvm/jdk-11
ENV PATH ${PATH}:${JAVA_HOME}/bin

WORKDIR /home/jenkins

COPY agent.jar agent.jar

COPY docker-entrypoint.sh entrypoint.sh

ENTRYPOINT ["bash","entrypoint.sh"]