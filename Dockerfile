FROM node
WORKDIR /app
ADD . /app
RUN npm install
EXPOSE 3000
# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku			
CMD npm start && gunicorn --bind 0.0.0.0:$PORT wsgi
