import http from "k6/http";
import { check } from "k6";
import { Rate } from "k6/metrics";

const email = __ENV.email;
const password = __ENV.password;

const responseStatusCounters = {
  "2": new Rate("2xx_rate"),
  "4": new Rate("4xx_count"),
  "5": new Rate("5xx_count"),
};

export default function () {
  let params = {
    headers: {
      "Content-Type": "application/json",
    },
  };

  const body = JSON.stringify({
    email: email,
    password: password,
  });

  let res = http.post(("https://app.respond.io/ajax/auth/login"), body, params);

  const status = res.status.toString();
  const [statusGroup] = status;
  Object.entries(responseStatusCounters).forEach(([k, v]) =>
    v.add(k === statusGroup)
  );

  if (
    !check(res, {
      "status was 200": (r) => r.status == 200,
    })
  ) {
    console.error(res.body);
  }
}
