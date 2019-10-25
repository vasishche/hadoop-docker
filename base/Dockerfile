FROM centos:7
RUN curl -fSL "https://archive.apache.org/dist/hadoop/common/hadoop-3.1.2/hadoop-3.1.2.tar.gz" -o /tmp/hadoop.tar.gz && \
    tar -zxf /tmp/hadoop.tar.gz -C /opt/ && \
    rm /tmp/hadoop.tar.gz
RUN yum -y install java-1.8.0-openjdk
RUN yum -y install epel-release
RUN yum -y install openssh-server openssh-clients passwd curl mysql socat && \
	yum clean all
ENV HADOOP_HOME="/usr/local/hadoop/current"
RUN mkdir /usr/local/hadoop && \
    ln -s /opt/hadoop-3.1.2/ $HADOOP_HOME && \
    mkdir $HADOOP_HOME/logs && \
    mkdir /opt/mount{1,2}
COPY conf/* $HADOOP_HOME/etc/hadoop/
VOLUME $HADOOP_HOME/logs
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
    chmod 0600 ~/.ssh/authorized_keys
RUN mkdir /opt/mount{1,2}/datanode-dir && \
    mkdir /opt/mount{1,2}/nodemanager-{local,log}-dir
RUN mkdir /opt/mount{1,2}/namenode-dir && \
    $HADOOP_HOME/bin/hdfs namenode -format cluster1
VOLUME /opt/mount1 /opt/mount2
CMD ["/bin/sh"]
