const REST_URL = "http://localhost:2020/rest/";

async function fetch2(url, method = "GET", body) {
  const response = await fetch(REST_URL + url, {
    method: method.toUpperCase(),
    body: JSON.stringify(body),
    headers: { "content-Type": "application/json" },
  });
  if (method.toUpperCase() != "DELETE") {
    return response.json();
  }
  return response;
}

async function fetch3(body) {
  const response = await fetch("http://localhost:2020/signup", {
    method: "POST",
    body: JSON.stringify(body),
    headers: { "content-Type": "application/json" },
  });
  return response;
}

async function springLogin(user, pass) {
  let username = user;
  let password = pass;

  const credentials =
    "username=" +
    encodeURIComponent(username) +
    "&password=" +
    encodeURIComponent(password);

  let response = await fetch("http://localhost:2020/login", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: credentials,
  });

  if (response.url.includes("error")) {
    console.log("Wrong username/password");
  }
}

export { fetch2, fetch3, springLogin };
