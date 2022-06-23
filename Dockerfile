FROM nginx:stable-alpine
WORKDIR /app


COPY ./webhookReceiver.rb ./FrontendDownload.sh ./

RUN apk add ruby build-base libffi-dev ruby-dev &&\ 
    gem install sinatra thin puma reel webrick && \
    chmod +x FrontendDownload.sh && \
    ./FrontendDownload.sh

COPY ./nginx.conf ./mime.types /etc/nginx/
COPY ./nginx-selfsigned.crt ./dhparam.pem /etc/ssl/certs/
COPY ./nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key
COPY ./self-signed.conf ./ssl-params.conf /etc/nginx/snippets/

EXPOSE 80 443


CMD nginx && ruby webhookReceiver.rb -p 3000 
