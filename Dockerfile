FROM node:6.2.1
RUN useradd --user-group --create-home --shell /bin/false app-user
ENV HOME=/home/app-user

COPY package.json npm-shrinkwrap.json $HOME/app/
RUN chown -R app-user:app-user $HOME/*

USER app-user
WORKDIR $HOME/app
RUN npm install

CMD ["node", "app.js"]
