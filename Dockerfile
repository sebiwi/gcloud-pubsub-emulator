FROM google/cloud-sdk:212.0.0-alpine

LABEL maintainer "Sebastian Caceres <contact.sebiwi@gmail.com>"

RUN apk --update add openjdk7-jre
RUN gcloud components install --quiet beta pubsub-emulator
RUN mkdir -p /var/pubsub

VOLUME /var/pubsub

EXPOSE 8085

CMD [ "gcloud", "beta", "emulators", "pubsub", "start", "--data-dir=/var/pubsub", "--host-port=0.0.0.0:8085", "--log-http", "--verbosity=debug", "--user-output-enabled" ]
