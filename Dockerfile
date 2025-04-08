FROM node:20-bullseye-slim AS build

COPY . /data

RUN apt update && \
  apt install git -y && \
  npx create-agent-ui@latest

FROM node:20-bullseye-slim

WORKDIR /data 

COPY --from=build /data/agent-ui /data/

CMD ["npm", "run", "dev"]
