# Getting Started

## Authentication

> Basic Authentication Header

```http
GET /api/v1/account HTTP/1.1
Authorization: Basic aGVsbG86d29ybGQ=

...
```

All requests to the Parakeet API require authentication.

To authenticate, use HTTP basic authentication with the **username** set to your Account ID, and the **password** set to your API Key. You can access your API key at any time by visiting your Parakeet Dashboard (on the Integrations page).

## Rate Limiting

> Standard Rate Limit Headers

```http
HTTP/1.1 200 OK
X-RateLimit-Remaining: 10
X-RateLimit-Limit: 120
X-RateLimit-Reset: 1505057280

...
```

> Exhausted Rate Limit Response

```http
HTTP/1.1 429 Too Many Requests
X-RateLimit-Remaining: 0
X-RateLimit-Limit: 120
X-RateLimit-Reset: 1505057280
Retry-After: 10

...
```

In order to ensure high availability and quality service for all of our users, Parakeet enforces a limit of 120 requests every 60 seconds over the API. The limit is enforced independently per account.

Each request will include the following headers

Header | Description
-------|--------
`X-RateLimit-Limit` | Maximum number of requests allowed per sampling window
`X-RateLimit-Remaining` | Remaining number of requests for the current time window
`X-RateLimit-Reset` | Timestamp when the current window rolls over 

### Detecting Rate Limit

If you exceed the rate limit, you will receive a `429 Too Many Requests` response from the API. Additionally, a `Retry-After` header will be added indicating the number of seconds you must wait before you will be able to make another API call.

### Other Rate Limits

Other endpoints in the Parakeet API may have specific rate limits that are more strict than the global rate limiter. For example, you may be rate limited when using the API to send text messages or provision phone numbers.

### Request Increased Limit

If you have specific needs that require a higher limit, please contact us. We'd be happy to better understand your use case and increase your rate limit if it's appropriate.

## Pagination

> Example Paginated Response

```http
HTTP/1.1 200 OK
Content-Type: application/json
Link: <https://api.parakeet.is/api/v1/users?cursor=abcdefg>; rel="next"; cursor="abcdefg",
      <https://api.parakeet.is/api/v1/users?cursor=abcdefg>; rel="prev"; cursor="abcdefg",

[ ... ]
```

All list endpoints in Parakeet support cursor based pagination for scrolling through large data sets. Cursor pagination provides stable sorted collections of results with snapshot-like semantics.

Links to next and previous pages of results are contained in the `Link` header of the HTTP reply. In addition to the complete URL, the header also separates out the parameter for the `cursor`, in case you would like to rebuild the URL yourself.

<aside class="notice">
Cursors are short-lived and tied to the request parameters used when originally loading results. Please do not store cursors, or attempt to use them on different requests.
</aside>

## Errors

The Parakeet API follows HTTP conventions for indicating errors. Successful requests will yield a response code in the 200 range. Failed requests will generate a non-200 response code.

Here are some of the status codes that the Parakeet API uses:

Code | Meaning
---------- | -------
400 | **Bad Request**: Your request could not be understood, or is invalid
401 | **Unauthorized**: Your API key is invalid or was not included
403 | **Forbidden**: Your request was authenticated, but you do not have access to the requested resource
404 | **Not Found**: The requested resource could not be found
405 | **Method Not Allowed**: The endpoint your requested does not support your request method
406 | **Not Acceptable**: You requested a non-JSON response format
422 | **Unprocessable Entity**: Your request was syntactically valid, but logically invalid
429 | **Too Many Requests**: You have exceeded the rate limit for the API
500 | **Internal Server Error**: Something went wrong in our app, we've been notified
