const REST_URL = "http://localhost:2020/rest/"

async function fetch2(url,method='GET', body){
    const response = await fetch(REST_URL + url,{
        method : method.toUpperCase(),
        body: JSON.stringify(body),
        headers:{"content-Type" : "application/json" }
    })
    if(method.toUpperCase() != 'DELETE'){
            return response.json();
    }
    return response;
}

export {
    fetch2
}