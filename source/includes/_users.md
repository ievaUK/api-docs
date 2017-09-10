# Users

Users are individual people that are able to make and receive calls under your Parakeet account. Using the Parakeet API, you can create, modify, and delete users on your account.

## User Object

```json
{
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
}
```

Parameter | Type | Description
--------- | ------- | -----------
id | string | Parakeet User ID
role | string | Set of permissions the user has `user`, `admin` or `owner`
email | string | Email address associated with the user
profile.first_name | string | First name for the user
profile.last_name | string | Last name for the user
created_at | date | Timestamp when the user was created
updated_at | date | Timestamp when the user was last updated

## Search Users

```shell
curl https://api.parakeet.is/api/v1/users
  -u '{accountId}:{apiKey}'
```

> Example Response

```http
HTTP/1.1 200 OK
Content-Type: application/json
Link: <https://api.parakeet.is/api/v1/users?cursor=abcdefg>; rel="next"; cursor="abcdefg"

[
  {
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
  }
]
```

Page through the Parakeet users in the account

### HTTP Request

`GET https://api.parakeet.is/api/v1/users`

### Query Parameters

Parameter | Type | Values
--------- | ------- | -----------
name | string | Search the users by name
limit | number | Number of results to return, max 100.

## Get User

```shell
curl https://api.parakeet.is/api/v1/users/{id}
  -u '{accountId}:{apiKey}'
```

> Example Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
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
}
```

Fetches a specific user by its identifier.

### HTTP Request

`GET https://api.parakeet.is/api/v1/users/{id}`

## Create User

```shell
curl https://api.parakeet.is/api/v1/users
  -H 'Content-Type: application/json'
  -u '{accountId}:{apiKey}'
  -d '{ \
    "email": "john.doe@company.com", \
    "profile": { \
      "first_name": "John", \
      "last_name": "Doe" \
    } \
  }'
```

> Example Response

```http
HTTP/1.1 201 Created
Content-Type: application/json
Location: https://api.parakeet.is/api/v1/users/US5ad75c3b670511e78b0727a6bbabf621

{
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
}
```

Creates a new Parakeet user. When a new user is created, Parakeet will automatically generate and send an invitation email that can be used to setup a password and start making calls.

<aside class="warning">
Creating a user may incur an additional charge to your account. Please see your billing page to determine your per-user cost.
</aside>