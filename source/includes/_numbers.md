# Numbers

Numbers are registered phone numbers under your Parakeet account that can be attached to users and teams. You can use the Parakeet API to provision new numbers, reassign numbers to a new destination, or delete numbers entirely.

## Number Object

```json
{
  "href": "/api/v1/numbers/PNb964a6be670811e7a538415bbbab7a13",
  "id": "PNb964a6be670811e7a538415bbbab7a13",
  "country_code": "US",
  "number": "+12673676170",
  "formatted_number": "(267) 367-6170",
  "status": "confirmed",
  "name": "Customer Service",
  "target_type": "team",
  "target": {
    "href": "/api/v1/teams/TM3a3586636b1911e7b0da9d1ed734b501",
    "id": "TM3a3586636b1911e7b0da9d1ed734b501"
  },
  "capabilities": [
    "voice",
    "mms",
    "sms"
  ],
  "created_at": "2017-07-12T13:48:02.585Z",
  "updated_at": "2017-08-21T20:19:12.856Z"
}
```

Parameter | Type | Description
--------- | ------- | -----------
id | string | Parakeet Number ID
country_code | string | ISO-2 country code for the phone number
number | string | E.164 formatted phone number
formatted_number | string | Phone number formatted to the country's national format
status | string | Current status of the number, either `porting` or `confirmed`
name | string | Name of the phone number for display, taken from the target
target_type | string | Type of the target that this number points to
target | object | Pointer to the object that this number routes to
capabilities | array | Array of capabilities supported by this number, array of `voice`, `sms`, and `mms`
created_at | date | Timestamp when the number was provisioned
updated_at | date | Timestamp when the number was last updated

## Search Numbers

```shell
curl https://api.parakeet.is/api/v1/numbers
  -u '{accountId}:{apiKey}'
```

> Example Response

```http
HTTP/1.1 200 OK
Content-Type: application/json
Link: <https://api.parakeet.is/api/v1/numbers?cursor=abcdefg>; rel="next"; cursor="abcdefg"

[
  {
    "href": "/api/v1/numbers/PNb964a6be670811e7a538415bbbab7a13",
    "id": "PNb964a6be670811e7a538415bbbab7a13",
    "country_code": "US",
    "number": "+12673676170",
    "formatted_number": "(267) 367-6170",
    "status": "confirmed",
    "name": "Customer Service",
    "target_type": "team",
    "target": {
      "href": "/api/v1/teams/TM3a3586636b1911e7b0da9d1ed734b501",
      "id": "TM3a3586636b1911e7b0da9d1ed734b501"
    },
    "capabilities": [
      "voice",
      "mms",
      "sms"
    ],
    "created_at": "2017-07-12T13:48:02.585Z",
    "updated_at": "2017-08-21T20:19:12.856Z"
  }
]
```

Page through the Parakeet numbers in the account

### HTTP Request

`GET https://api.parakeet.is/api/v1/numbers`

### Query Parameters

Parameter | Type | Values
--------- | ------- | -----------
limit | number | Number of results to return, max 100.

## Get Number

```shell
curl https://api.parakeet.is/api/v1/numbers/{id}
  -u '{accountId}:{apiKey}'
```

> Example Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "href": "/api/v1/numbers/PNb964a6be670811e7a538415bbbab7a13",
  "id": "PNb964a6be670811e7a538415bbbab7a13",
  "country_code": "US",
  "number": "+12673676170",
  "formatted_number": "(267) 367-6170",
  "status": "confirmed",
  "name": "Customer Service",
  "target_type": "team",
  "target": {
    "href": "/api/v1/teams/TM3a3586636b1911e7b0da9d1ed734b501",
    "id": "TM3a3586636b1911e7b0da9d1ed734b501"
  },
  "capabilities": [
    "voice",
    "mms",
    "sms"
  ],
  "created_at": "2017-07-12T13:48:02.585Z",
  "updated_at": "2017-08-21T20:19:12.856Z"
}
```

Fetches a specific number by its identifier.

### HTTP Request

`GET https://api.parakeet.is/api/v1/numbers/{id}`

## Delete Number

```shell
curl https://api.parakeet.is/api/v1/numbers/{id}
  -X DELETE
  -H 'Content-Type: application/json'
  -u '{accountId}:{apiKey}'
```

> Example Response

```http
HTTP/1.1 204 No Content
Content-Type: application/json
```

Deletes an existing phone number. The number will be deleted immediately and released from your account. Once released, Parakeet may not be able to retrieve this number for you again.

<aside class="warning">
Please be extra cautious when managing phone numbers via the API. There is no guarantee that we will be able to return a number that was accidentally deleted.
</aside>

## Provision Number

```shell
curl https://api.parakeet.is/api/v1/numbers
  -X POST
  -H 'Content-Type: application/json'
  -u '{accountId}:{apiKey}'
  -d '{ "number": "+12125551234", "target": "TM3a3586636b1911e7b0da9d1ed734b501" }'
```

> Example Response

```http
HTTP/1.1 201 Created
Content-Type: application/json
Location: https://api.parakeet.is/api/v1/numbers/PNb964a6be670811e7a538415bbbab7a13

{
  "href": "/api/v1/numbers/PNb964a6be670811e7a538415bbbab7a13",
  "id": "PNb964a6be670811e7a538415bbbab7a13",
  "country_code": "US",
  "number": "+12125551234",
  "formatted_number": "(212) 555-1234",
  "status": "confirmed",
  "name": "Customer Service",
  "target_type": "team",
  "target": {
    "href": "/api/v1/teams/TM3a3586636b1911e7b0da9d1ed734b501",
    "id": "TM3a3586636b1911e7b0da9d1ed734b501"
  },
  "capabilities": [
    "voice",
    "mms",
    "sms"
  ],
  "created_at": "2017-07-12T13:48:02.585Z",
  "updated_at": "2017-08-21T20:19:12.856Z"
}
```

Provisions a new phone number that was found using the Available Numbers API.

### Body

Parameter | Type | Values
--------- | ------- | -----------
number | number | Phone number returned from the Available Numbers API
target | string or object | Pointer to a user or team that this number should route to

## Update Number

```shell
curl https://api.parakeet.is/api/v1/numbers/PNb964a6be670811e7a538415bbbab7a13
  -X POST
  -H 'Content-Type: application/json'
  -u '{accountId}:{apiKey}'
  -d '{ "target": "TM3a3586636b1911e7b0da9d1ed734b501" }'
```

> Example Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "href": "/api/v1/numbers/PNb964a6be670811e7a538415bbbab7a13",
  "id": "PNb964a6be670811e7a538415bbbab7a13",
  "country_code": "US",
  "number": "+12125551234",
  "formatted_number": "(212) 555-1234",
  "status": "confirmed",
  "name": "Customer Service",
  "target_type": "team",
  "target": {
    "href": "/api/v1/teams/TM3a3586636b1911e7b0da9d1ed734b501",
    "id": "TM3a3586636b1911e7b0da9d1ed734b501"
  },
  "capabilities": [
    "voice",
    "mms",
    "sms"
  ],
  "created_at": "2017-07-12T13:48:02.585Z",
  "updated_at": "2017-08-21T20:19:12.856Z"
}
```

Updates a phone number and reassigns it to a new destination.

### Body

Parameter | Type | Values
--------- | ------- | -----------
target | string or object | Pointer to a user or team that this number should route to