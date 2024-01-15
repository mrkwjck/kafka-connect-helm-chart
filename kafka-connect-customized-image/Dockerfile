FROM bitnami/kafka:3.6.1

COPY /connectors/ /opt/bitnami/kafka/libs/connectors/
COPY /libs/ /opt/bitnami/kafka/libs/
COPY --chmod=755 /scripts/ /opt/bitnami/kafka/bin