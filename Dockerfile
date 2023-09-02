FROM node: 3.5.2
WORKDIR usr/src/app
COPY . .
RUN npm install
RUN npm run test
EXPOSE 8000
CMD ["node","app.js"]
