import { serveFile } from "jsr:@std/http/file-server";

Deno.serve({ port: 8080 }, (req: Request) => {
  const pathname = new URL(req.url).pathname;

  console.log(pathname);
  if (pathname === "index.html" || pathname === "/") {
    return serveFile(req, "door.html");
  }

  return new Response("404: Not Found", {
    status: 404,
  });
});
