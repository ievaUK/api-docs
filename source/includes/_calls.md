# Calls

In Parakeet, a Call object is a representation of an active call. Calls represent a single leg of a conversation. For example, if one Parakeet user places a call to another, two Call resources will be created. Each will have their own status, disposition, and perspective on the data.

This understanding is critical to the way calls function in Parakeet.

## Call Object

```json
{
  "href": "/api/v1/calls/CA663b709f951611e787aae7b5749363bb",
  "id": "CA663b709f951611e787aae7b5749363bb",
  "direction": "inbound",
  "status": "completed",
  "disposition": "connected",
  "duration": 5,
  "remote": "+12125551234",
  "contact": { ... },
  "user": { ... },
  "number": {
    "href": "/api/v1/numbers/PNb964a6be670811e7a538415bbbab7a13",
    "id": "PNb964a6be670811e7a538415bbbab7a13"
  },
  "comments": false,
  "tags": [],
  "started_at": "2017-09-09T04:21:49.626Z",
  "active_at": "2017-09-09T04:21:51.046Z",
  "ended_at": "2017-09-09T04:21:56.326Z",
  "created_at": "2017-09-09T04:21:49.507Z",
  "updated_at": "2017-09-09T04:21:56.398Z"
}
```

Parameter | Type | Description
--------- | ------- | -----------
id | string | Parakeet Call ID
direction | string | `inbound` if the call was received, `outbound` if it was placed
status | string | Current status of the call
disposition | string | Disposition of the call (`null` until status is `completed`)
remote | string | Handle for the participant on the other end of the call
contact | [Contact](#contact-object) | Contact on the other end of the call, or `null` if none was found
user | [User](#user-object) | User who spoke on the call, if known
number | [Number](#number-object) | Number that the call was made/received on
started_at | date | Timestamp when the call started ringing
active_at | date | Timestamp when the call went to an active status
ended_at | date | Timestamp when the call was completed

## Search Calls

```shell
curl https://api.parakeet.is/api/v1/calls
  -u '{accountId}:{apiKey}'
```

> Example Response

```http
HTTP/1.1 200 OK
Content-Type: application/json
Link: <https://api.parakeet.is/api/v1/calls?cursor=abcdefg>; rel="next"; cursor="abcdefg"

[
  {
    "href": "/api/v1/calls/CA663b709f951611e787aae7b5749363bb",
    "id": "CA663b709f951611e787aae7b5749363bb",
    "direction": "inbound",
    "status": "completed",
    "disposition": "connected",
    "duration": 5,
    "remote": "+12125551234",
    "contact": { ... },
    "user": { ... },
    "number": {
      "href": "/api/v1/numbers/PNb964a6be670811e7a538415bbbab7a13",
      "id": "PNb964a6be670811e7a538415bbbab7a13"
    },
    "comments": false,
    "tags": [],
    "started_at": "2017-09-09T04:21:49.626Z",
    "active_at": "2017-09-09T04:21:51.046Z",
    "ended_at": "2017-09-09T04:21:56.326Z",
    "created_at": "2017-09-09T04:21:49.507Z",
    "updated_at": "2017-09-09T04:21:56.398Z"
  }
]
```

Paginations through all of the call history on the given account. The returned list can be filtered and paginated using the standard Parakeet API practices.

### HTTP Request

`GET https://api.parakeet.is/api/v1/calls`

### Query Parameters

Parameter | Type | Values
--------- | ------- | -----------
status | string | One of `queued`, `ringing`, `in_progress`, or `completed`
disposition | string | One of `connected`, `failed`, `canceled`, `busy`, or `no_answer`
tags | string | Name of a tag to search for
limit | number | Number of results to return, max 100.

## Get Call

```shell
curl https://api.parakeet.is/api/v1/calls/CA663b709f951611e787aae7b5749363bb
  -u '{accountId}:{apiKey}'
```

> Example Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "href": "/api/v1/calls/CA663b709f951611e787aae7b5749363bb",
  "id": "CA663b709f951611e787aae7b5749363bb",
  "direction": "inbound",
  "status": "completed",
  "disposition": "connected",
  "duration": 5,
  "remote": "+12125551234",
  "contact": { ... },
  "user": { ... },
  "number": {
    "href": "/api/v1/numbers/PNb964a6be670811e7a538415bbbab7a13",
    "id": "PNb964a6be670811e7a538415bbbab7a13"
  },
  "comments": false,
  "tags": [],
  "started_at": "2017-09-09T04:21:49.626Z",
  "active_at": "2017-09-09T04:21:51.046Z",
  "ended_at": "2017-09-09T04:21:56.326Z",
  "created_at": "2017-09-09T04:21:49.507Z",
  "updated_at": "2017-09-09T04:21:56.398Z"
}
```

Fetch a specific call by its identifier. The returned type of this endpoint is the same as the search calls endpoint above.

### HTTP Request

`GET https://api.parakeet.is/api/v1/calls/{id}`

## Tag Call

```shell
curl https://api.parakeet.is/api/v1/calls/CA663b709f951611e787aae7b5749363bb/tags
  -H 'Content-Type: application/json'
  -u '{accountId}:{apiKey}'
  -d '["Billing"]'
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

There are a few different endpoints for managing the tags associated with a call, depending on your needs. You can either add tags to the existing list, remove tags from the list, or replace the entire list with a new one.

The content of each of these requests is the same: an array of strings indicating the tags that should be modified. Please see the examples for detail.

### Add Tags

`POST https://api.parakeet.is/api/v1/calls/{id}/tags`

### Remove Tags

`DELETE https://api.parakeet.is/api/v1/calls/{id}/tags`

### Replace Tags

`PUT https://api.parakeet.is/api/v1/calls/{id}/tags`

## Comment on Call

```shell
curl https://api.parakeet.is/api/v1/calls/CA663b709f951611e787aae7b5749363bb/comments
  -H 'Content-Type: application/json'
  -u '{accountId}:{apiKey}'
  -d '{ "content": "Hello World", "user": "US5ad75c3b670511e78b0727a6bbabf621" }'
```

> Example Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "content": "Hello World",
  "user": {
    "href": "/api/v1/users/US5ad75c3b670511e78b0727a6bbabf621",
    "id": "US5ad75c3b670511e78b0727a6bbabf621",
    "role": "owner",
    "email": "john@parakeet.is",
    "profile": {
      "first_name": "John",
      "last_name": "Smith",
      "role": "Owner",
      "time_zone": "America/New_York",
      "image": {
        "48": "https://static.parakeet.is/images/48.png",
        "64": "https://static.parakeet.is/images/64.png",
        "256": "https://static.parakeet.is/images/256.png",
        "512": "https://static.parakeet.is/images/512.png",
        "original": "https://static.parakeet.is/images/original.png"
      },
      "default_image": true
    },
    "schedule": {
      "href": "/api/v1/users/US5ad75c3b670511e78b0727a6bbabf621/schedule"
    },
    "created_at": "2017-07-12T13:23:55.463Z",
    "updated_at": "2017-07-27T01:13:16.138Z"
  },
  "created_at": "2017-07-12T13:23:55.463Z",
  "updated_at": "2017-07-27T01:13:16.138Z"
}
```

Similar to tags, comments on a call can be editing using the subresource endpoint. When using your API key to modify comments on a call, you must provide a user to associate the comments with.

### Add or Update Comments

`POST https://api.parakeet.is/api/v1/calls/{id}/comments`

### Remove Comments

`DELETE https://api.parakeet.is/api/v1/calls/{id}/comments`
