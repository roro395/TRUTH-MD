FROM node:lts

  RUN apt-get update && apt-get install -y --no-install-recommends ffmpeg imagemagick webp git python3 make g++ && apt-get clean

  WORKDIR /app

  COPY package*.json ./

  RUN npm install && npm cache clean --force

  COPY . .

  EXPOSE 3000 5000

  ENV NODE_ENV=production

  CMD ["npm", "run", "start"]
  