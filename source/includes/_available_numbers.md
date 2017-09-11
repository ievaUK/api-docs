# Available Numbers

Available numbers are phone numbers that you can provision for your account. You can use the Parakeet API platform to filter through available numbers and provision one for your account.

## Available Number Object

```json
{
  "id": "+12125551234",
  "number": "+12125551234",
  "country": "US",
  "type": "local",
  "address_requirement": "none"
}
```

Parameter | Type | Description
--------- | ------- | -----------
id | string | E.164 Formatted Phone Number
number | string | E.164 Formatted Phone Number
country | string | ISO-2 country code for the number
type | string | Type of number, one of `local`, `mobile`, or `toll_free`
address_requirement | string | Physical address obligation, one of `none`, `local`, `foreign`, or `any`

## Search Available Numbers

```shell
curl https://api.parakeet.is/api/v1/available_numbers
  -u '{accountId}:{apiKey}'
```

> Example Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

[
  {
    "id": "+12125551234",
    "number": "+12125551234",
    "country": "US",
    "type": "local",
    "address_requirement": "none"
  }
]
```

Searches available phone numbers.

### Query Parameters

Parameter | Type | Description
--------- | ------- | -----------
*country* | string | ISO-2 country code to search for numbers
*type* | string | Phone number type, one of `local`, `mobile`, or `toll_free`
query | string | Fitler for phone numbers containing an alphanumeric string

### HTTP Request

`GET https://api.parakeet.is/api/v1/available_numbers`