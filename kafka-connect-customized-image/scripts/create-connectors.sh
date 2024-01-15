while :; do
    curl_status=$(curl -s -o /dev/null -w %{http_code} http://localhost:8083/connectors)
    if [ $curl_status -eq 200 ]; then
        break
    fi
    echo "Waiting for Kafka Connect API to start listening"
    echo "Kafka Connect listener HTTP state: " $curl_status " (waiting for 200)"
    sleep 5
done

for connector in /opt/bitnami/kafka/config/connector-config-*
do
  echo "Creating connector "$connector
  curl -X POST http://localhost:8083/connectors -H "Content-Type: application/json" -d $(cat $connector)
done

exit 0