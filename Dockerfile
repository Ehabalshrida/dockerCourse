FROM node:20
WORKDIR /app
COPY package.json .

ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
    then npm install; \
    else npm install --only=production; \
    fi

COPY . .
ENV PORT 5000
EXPOSE $PORT
CMD ["npm", "run", "start-dev"]
# /*/////////////////////////*/
# FROM node:20 as base
# WORKDIR /app
# COPY package.json .

# FROM base as development
# RUN npm install
# COPY . .
# EXPOSE $PORT
# CMD ["npm", "run", "start-dev"]

# FROM base as production
# RUN npm install --only=production
# COPY . .
# EXPOSE $PORT
# CMD ["npm", "run", "start"]