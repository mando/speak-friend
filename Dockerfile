FROM denoland/deno

EXPOSE 8080
WORKDIR /app
USER deno

COPY door.html main.ts ./

RUN deno cache main.ts
CMD ["deno", "run", "--allow-read", "--allow-net", "main.ts" ]
