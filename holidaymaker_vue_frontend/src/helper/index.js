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
  const response = await fetch("http://localhost:2020/customsignup", {
    method: "POST",
    body: JSON.stringify(body),
    headers: { "content-Type": "application/json" },
  });
  return response;
}

function transformRequest(jsonData = {}){
  return Object.entries(jsonData)
    .map(x => `${encodeURIComponent(x[0])}=${encodeURIComponent(x[1])}`)
    .join('&');
}



export { fetch2, fetch3,transformRequest };
