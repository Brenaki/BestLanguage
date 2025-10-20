import http from 'k6/http';
import { check } from 'k6';

export const options = {
  scenarios: {
    fixed_iterations: {
      executor: 'per-vu-iterations',
      vus: 500,
      iterations: 200,
    },
  },
};

const url = 'http://localhost:3019/';
const params = {
  headers: { 'Content-Type': 'application/json' },
  timeout: '5s',
};

export default function () {
  const res = http.post(url, JSON.stringify({ number: 17 }), params);
  check(res, { 'status is 200': (r) => r.status === 200 });
}