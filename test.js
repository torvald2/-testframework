import http from 'k6/http';
import { sleep } from 'k6';

export default function () {
	  http.get('http://test.k6.io');
      console.log("TEST")
      console.error("TEST")
	  sleep(1);
}