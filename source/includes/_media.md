# Media

In Parakeet, media can be used as prompts and greetings played to callers as they contact your teams. You can upload and manage your media through the API.

## Media Object

```json
{
  "href": "/api/v1/media/MD9762a6db808511e7b97f892c90bd531f",
  "id": "MD9762a6db808511e7b97f892c90bd531f",
  "name": "IVR Greeting",
  "duration": 22,
  "url": "https://static.parakeet.is/media.mp3",
  "created_at": "2017-08-14T00:14:51.687Z",
  "updated_at": "2017-08-14T00:14:51.742Z"
}
```

Parameter | Type | Description
--------- | ------- | -----------
id | string | Parakeet Media ID
name | string | Name given to the media file when uplaoded
duration | number | Duration of the media file in seconds
url | string | Temporary URL to access the media file
created_at | date | Timestamp when the media was uploaded
updated_at | date | Timestamp when the media was last updated

## Search Media

```shell
curl https://api.parakeet.is/api/v1/media
  -u '{accountId}:{apiKey}'
```

> Example Response

```http
HTTP/1.1 200 OK
Content-Type: application/json
Link: <https://api.parakeet.is/api/v1/media?cursor=abcdefg>; rel="next"; cursor="abcdefg"

[
  {
    "href": "/api/v1/media/MD57ea307d73c011e7a73fff738c977c1b",
    "id": "MD57ea307d73c011e7a73fff738c977c1b",
    "name": "IVR Greeting",
    "duration": 22,
    "url": "https://static.parakeet.is/media.mp3",
    "created_at": "2017-07-28T18:12:40.394Z",
    "updated_at": "2017-09-10T05:03:23.331Z"
  }
]
```

Page through the Parakeet media in the account

### HTTP Request

`GET https://api.parakeet.is/api/v1/media`

### Query Parameters

Parameter | Type | Values
--------- | ------- | -----------
limit | number | Number of results to return, max 100.

## Get Media

```shell
curl https://api.parakeet.is/api/v1/media/{id}
  -u '{accountId}:{apiKey}'
```

> Example Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "href": "/api/v1/media/MD57ea307d73c011e7a73fff738c977c1b",
  "id": "MD57ea307d73c011e7a73fff738c977c1b",
  "name": "IVR Greeting",
  "duration": 22,
  "url": "https://static.parakeet.is/media.mp3",
  "created_at": "2017-07-28T18:12:40.394Z",
  "updated_at": "2017-09-10T05:03:23.331Z"
}
```

Fetches a specific media file by its identifier.

### HTTP Request

`GET https://api.parakeet.is/api/v1/media/{id}`

## Delete Media

```shell
curl https://api.parakeet.is/api/v1/media/{id}
  -X DELETE
  -H 'Content-Type: application/json'
  -u '{accountId}:{apiKey}'
```

> Example Response

```http
HTTP/1.1 204 No Content
Content-Type: application/json
```

Deletes an existing media file. The media file will be immediately deleted and any previously generated links will no longer be valid.

<aside class="warning">
Please be cautious when deleting media that is in use.
</aside>