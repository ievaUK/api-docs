# Addresses

Addresses are representations of your physical addresses that you may need to register with Parakeet. In some cases, governments require addresses to require a physical address. You'll know this is required when you see `address_type` of something other than `none` when using the Available Numbers API.

Note that, by government regulation, Parakeet may share this address with local and state governments as part of the process of registering your phone number. If a phone number depends on an address being registered, you will not be able to delete that address.

## Address Object

```json
{
  "href": "/api/v1/addresses/ADd42adc1796f211e7a8d47328fce341c6",
  "id": "ADd42adc1796f211e7a8d47328fce341c6",
  "friendly_name": "New York Office",
  "name": "Parakeet Communications",
  "street": "16 W 22nd Street",
  "street2": null,
  "city": "New York",
  "region": "NY",
  "postal_code": "10010",
  "country_code": "US",
  "created_at": "2017-09-11T13:12:14.387Z",
  "updated_at": "2017-09-11T13:12:14.387Z"
}
```

Parameter | Type | Description
--------- | ------- | -----------
id | string | Parakeet Address ID
friendly_name | string | Friendly display name for this address (used for your records only)
name | string | Personanl or company name associated with the address
street | string | Primary street address
city | string | City
region | string | State, province, or local region name
postal_code | string | ZIP code, postal code, or local equivalent
country_code | string | ISO-2 country code
created_at | date | Timestamp when the address was created
updated_at | date | Timestamp when the address was last updated.

## Search Addresses

```shell
curl https://api.parakeet.is/api/v1/addresses
  -u '{accountId}:{apiKey}'
```

> Example Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

[
  {
    "href": "/api/v1/addresses/ADd42adc1796f211e7a8d47328fce341c6",
    "id": "ADd42adc1796f211e7a8d47328fce341c6",
    "friendly_name": "New York Office",
    "name": "Parakeet Communications",
    "street": "16 W 22nd Street",
    "street2": null,
    "city": "New York",
    "region": "NY",
    "postal_code": "10010",
    "country_code": "US",
    "created_at": "2017-09-11T13:12:14.387Z",
    "updated_at": "2017-09-11T13:12:14.387Z"
  }
]
```

Searches all registered addresses

### HTTP Request

`GET https://api.parakeet.is/api/v1/addresses`

## Add Address

```shell
curl https://api.parakeet.is/api/v1/addresses
  -H 'Content-Type: application/json'
  -u '{accountId}:{apiKey}'
  -d '{ \
    "friendly_name": "New York Office", \
    "name": "Parakeet Communications", \
    "street": "16 W 22nd Street", \
    "city": "New York", \
    "region": "NY", \
    "postal_code": "10010", \
    "country_code": "US"
  }'
```

> Example Response

```http
HTTP/1.1 201 Created
Content-Type: application/json
Location: https://api.parakeet.is/api/v1/addresses/ADd42adc1796f211e7a8d47328fce341c6

{
  "href": "/api/v1/addresses/ADd42adc1796f211e7a8d47328fce341c6",
  "id": "ADd42adc1796f211e7a8d47328fce341c6",
  "friendly_name": "New York Office",
  "name": "Parakeet Communications",
  "street": "16 W 22nd Street",
  "street2": null,
  "city": "New York",
  "region": "NY",
  "postal_code": "10010",
  "country_code": "US",
  "created_at": "2017-09-11T13:12:14.387Z",
  "updated_at": "2017-09-11T13:12:14.387Z"
}
```

Provisions a new address on the Parakeet platform

### HTTP Request

`POST https://api.parakeet.is/api/v1/addresses`

## Delete Address

```shell
curl https://api.parakeet.is/api/v1/addresses/{id}
  -X DELETE
  -u '{accountId}:{apiKey}'
}
```

> Example Response

```http
HTTP/1.1 204 No Content
Content-Type: application/json
```

Deletes a specific address by its identifier.

### HTTP Request

`DELETE https://api.parakeet.is/api/v1/addresses/{id}`