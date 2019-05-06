# FROM node:11.14.0-alpine as builder

# ARG REACT_APP_ENV
# ENV REACT_APP_ENV ${REACT_APP_ENV}

# WORKDIR '/app'

# COPY package.json .

# RUN npm install -g yarn && yarn install

# COPY . .

# RUN yarn build:env

# FROM nginx

# COPY --from=builder /app/build /usr/share/nginx/html

# COPY deploy/nginx.conf /etc/nginx/nginx.conf

# EXPOSE 80

# ENTRYPOINT ["nginx","-g","daemon off;"]
