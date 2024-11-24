FROM node:lts-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx as runner
COPY --from=builder /app/build /usr/share/nginx/html
# No need to specify CMD here, because the default command for the nginx image is to start nginx
