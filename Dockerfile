M java:8-jre

ENV SPARK_HOME /usr/local/spark
ENV PATH $SPARK_HOME/bin:$PATH
RUN mkdir -p "$SPARK_HOME"
WORKDIR $SPARK_HOME
ENV SPARK_VERSION 1.3.0
ENV SPARK_VARIANT hadoop2.4

ENV SPARK_TGZ_URL http://www.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-$SPARK_VARIANT.tgz

RUN curl -SL "$SPARK_TGZ_URL" -o spark.tar.gz \
	&& tar -xvf spark.tar.gz --strip-components=1 \
	&& rm spark.tar.gz*

EXPOSE 8081
ENTRYPOINT ["./bin/spark-class", "org.apache.spark.deploy.worker.Worker"]

