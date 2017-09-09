# Account

Accounts in Parakeet are the top level item that contains all of your calls, users, teams, etc. Each API key grants access to a single account. You can use these endpoints to get information about the account that the API key belongs to.

## Account Object

```json
{
  "href": "/api/v1/account",
  "id": "AC5aca3cd9670511e78b0727a6bbabf621",
  "name": "Parakeet Communications, Inc.",
  "domain": "parakeet",
  "country": "US",
  "endpoint": "https://parakeet.parakeet.is",
  "sip_endpoint": "AC5aca3cd9670511e78b0727a6bbabf621.sip.dev.parakeet.is",
  "sip_domain": "AC5aca3cd9670511e78b0727a6bbabf621.sip.dev.parakeet.is",
  "sip_transport": "tls",
  "sip_port": 5061,
  "created_at": "2017-07-12T13:23:55.372Z",
  "updated_at": "2017-07-30T00:43:59.798Z"
}
```

Parameter | Type | Description
--------- | ------- | -----------
id | string | Parakeet Account ID
name | string | Display name for the account
domain | string | Unique Parakeet domain for the account
country | string | ISO-2 default country code for the account
endpoint | string | URL to login to this account
sip_endpoint | string | Endpoint that should be used for SIP connections
sip_domain | string | Domain that should be used for SIP requests
sip_transport | string | SIP transport mode (always TLS)
sip_port | number | Port that should be used for connecting via SIP
created_at | date | Timestamp that the account was created
updated_at | date | Timestamp that the account was created

## View Account

```shell
curl https://api.parakeet.is/api/v1/account
  -u '{accountId}:{apiKey}'
```

> Example Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "href": "/api/v1/account",
  "id": "AC5aca3cd9670511e78b0727a6bbabf621",
  "name": "Parakeet Communications, Inc.",
  "domain": "parakeet",
  "country": "US",
  "endpoint": "https://parakeet.parakeet.is",
  "sip_endpoint": "AC5aca3cd9670511e78b0727a6bbabf621.sip.dev.parakeet.is",
  "sip_domain": "AC5aca3cd9670511e78b0727a6bbabf621.sip.dev.parakeet.is",
  "sip_transport": "tls",
  "sip_port": 5061,
  "created_at": "2017-07-12T13:23:55.372Z",
  "updated_at": "2017-07-30T00:43:59.798Z"
}
```

Retrieve information about the current account.

### HTTP Request

`GET https://api.parakeet.is/api/v1/account`