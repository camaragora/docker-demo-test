FROM node
WORKDIR /app
ADD . /app
RUN npm install
#EXPOSE 3000
# Run the image as a non-root user
RUN adduser -D myuser
USER myuser

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku			
CMD [ "gunicorn --bind 0.0.0.0:$PORT wsgi ","npm start"]
