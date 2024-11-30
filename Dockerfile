FROM denoland/deno:2.1.1

EXPOSE 8080
WORKDIR /app
USER deno

COPY door.html main.ts ./

RUN deno cache main.ts
CMD ["run", "--allow-read", "--allow-net", "main.ts" ]
