import http from "k6/x/atb/httpclient"
import ni from "k6/x/atb/dateincrement"
//import http from "k6/http"

const client = http.new({"foo":"jar"}, "https://google.com")
const num = ni.new("2015-01-01",1)

export default function () {
    console.log(num.get())
    client.get("https://google.com")
}