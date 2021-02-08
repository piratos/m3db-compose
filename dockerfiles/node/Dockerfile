FROM alpine:latest
WORKDIR /app
ADD m3dbnode /bin
EXPOSE 2379 2380 9000 9001 9002 9003 9004
ENTRYPOINT [ "/bin/m3dbnode" ]
CMD [ "-f", "/etc/m3dbnode/m3dbnode.yml" ]
