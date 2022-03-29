FROM nginx
COPY index.html /usr/share/nginx/html/index.html
RUN apt-get update && apt-get install vim -y
RUN touch /tmp/1 /tmp/2 /tmp/3 /tmp/4 /tmp/5
RUN touch a1 a2
ENV var1 value1
WORKDIR /tmp
RUN touch w1 w2 w3 w4 w5
WORKDIR /etc
RUN touch e1 e2
WORKDIR /tmp
USER nginx
RUN touch nginx_1 nginx_2
ADD abcd.tar /tmp
USER root
EXPOSE 81
ENTRYPOINT ["echo","subodh"]
CMD ["dere"]
