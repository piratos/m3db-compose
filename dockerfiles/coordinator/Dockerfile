FROM alpine:latest
WORKDIR /app
ADD m3coordinator /bin
EXPOSE 7201/tcp 7203/tcp
ENTRYPOINT [ "/bin/m3coordinator" ]
CMD [ "-f", "/etc/m3coordinator/m3coordinator.yml" ]
