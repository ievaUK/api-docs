# Tags

Tags can help you keep your Parakeet activity organized by providing high level categorization for call and messaging activity. Through the Parakeet API, you can browse and manage your existing tags collection.

## Tag Object

```json
{
  "name": "Billing",
  "color": "ff0000"
}
```

Parameter | Type | Description
--------- | ------- | -----------
name | string | Unique name for the tag
color | string | Color that will be used for the tag

## Create Tag

```shell
curl https://api.parakeet.is/api/v1/tags
  -H 'Content-Type: application/json'
  -u '{accountId}:{apiKey}'
  -d '{ "name": "Billing", "color": "ff0000" }'
```

> Example Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

[
  {
    "name": "Billing",
    "color": "ff0000"
  }
]
```

Creates a new tag that can be used on calls.

### HTTP Request

`POST https://api.parakeet.is/api/v1/tags`

## Update Tag

```shell
curl https://api.parakeet.is/api/v1/tags/Billing
  -H 'Content-Type: application/json'
  -u '{accountId}:{apiKey}'
  -d '{ "color": "00ff00" }'
```

> Example Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

[
  {
    "name": "Billing",
    "color": "00ff00"
  }
]
```

Updates an existing tag and allows you to update its color.

### HTTP Request

`POST https://api.parakeet.is/api/v1/tags/{name}`

## Delete Tag

```shell
curl https://api.parakeet.is/api/v1/tags/Billing
  -X DELETE
  -H 'Content-Type: application/json'
  -u '{accountId}:{apiKey}'
```

> Example Response

```http
HTTP/1.1 204 No Content
Content-Type: application/json
```

Deletes a tag, removing it from all calls and preventing it from being used in the future.

### HTTP Request

`DELETE https://api.parakeet.is/api/v1/tags/{name}`