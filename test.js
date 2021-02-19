import http1 from "k6/x/atb/httpclient"
import http from "k6/http"

//const client = http.new({"foo":"jar"}, "https://google.com")
export default function () {
    http.get("https://google.com")
    console.log(1)
	  
}