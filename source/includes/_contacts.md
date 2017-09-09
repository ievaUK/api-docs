# Contacts

Contacts allow you to associate people and companies with phone numbers. When making or receiving calls in Parakeet, contacts will be automatically searched, giving you more valuable information than a simple phone number.

Parakeet contacts can come from three different sources:

 - Contacts created directly via the Parakeet applications our API
 - Contacts automatically managed by Parakeet to reflect teams and users
 - Contacts imported from supported integrations

While all contacts can be searched using the Parakeet API, only contacts created by the Parakeet apps can be managed by the API. Attempts to edit imported contacts, or managed contacts, will result in an `uneditable_contact` error.

### Contact Object

```json
{
  "href": "/api/v1/contacts/CNa402c39f726411e7a2d617b4f2b45fec",
  "id": "CNa402c39f726411e7a2d617b4f2b45fec",
  "title": null,
  "color": "862D0C",
  "display_name": "Mollie Nolan",
  "first_name": "Mollie",
  "middle_name": null,
  "last_name": "Nolan",
  "suffix": null,
  "nickname": null,
  "role": "Denials Analyst",
  "company_name": "HSS",
  "default_image": true,
  "image": {
    "48": "https://static.parakeet.is/images/48.png",
    "64": "https://static.parakeet.is/images/64.png",
    "256": "https://static.parakeet.is/images/256.png",
    "512": "https://static.parakeet.is/images/512.png",
    "original": "https://static.parakeet.is/images/original.png"
  },
  "birth_date": null,
  "time_zone": null,
  "phone_numbers": [
    {
      "label": "Home",
      "country_code": "US",
      "number": "+19167642508",
      "primary": false
    }
  ],
  "emails": [],
  "addresses": [],
  "notes": null,
  "reference": null,
  "created_at": "2017-07-27T00:43:43.203Z",
  "updated_at": "2017-09-08T23:13:35.791Z"
}
```

Parameter | Type | Description
--------- | ------- | -----------
id | string | Parakeet Account ID
title | string | Personal or professional title for the contact (Dr, Mr, Mrs, etc)
color | string | Randomly generated color that can be used to create a default image
display_name | string | Formatted name that should be displayed to the user
first_name | string | First name of the contact
middle_name | string | Middle name of the contact
last_name | string | Last name of the contact
suffix | string | Suffix for the contacts name
nickname | string | Special nickname for the contact
company_name | string | Name of the company that the contact belongs to
default_image | boolean | `true` if the image object is a Parakeet generated default
time_zone | string | Time zone that the contact is located in
birth_date | string | Birth date for the contact
created_at | date | Timestamp when the contact was created
updated_at | date | Timestamp when the contact was last updated

## Search Contacts

```http
HTTP/1.1 200 OK
Content-Type: application/json
Link: <https://api.parakeet.is/api/v1/contacts?cursor=abcdefg>; rel="next"; cursor="abcdefg"

[
  {
    "href": "/api/v1/contacts/CNa402c39f726411e7a2d617b4f2b45fec",
    "id": "CNa402c39f726411e7a2d617b4f2b45fec",
    "title": null,
    "color": "862D0C",
    "display_name": "Mollie Nolan",
    "first_name": "Mollie",
    "middle_name": null,
    "last_name": "Nolan",
    "suffix": null,
    "nickname": null,
    "role": "Denials Analyst",
    "company_name": "HSS",
    "default_image": true,
    "image": {
      "48": "https://static.parakeet.is/images/48.png",
      "64": "https://static.parakeet.is/images/64.png",
      "256": "https://static.parakeet.is/images/256.png",
      "512": "https://static.parakeet.is/images/512.png",
      "original": "https://static.parakeet.is/images/original.png"
    },
    "birth_date": null,
    "time_zone": null,
    "phone_numbers": [
      {
        "label": "Home",
        "country_code": "US",
        "number": "+19167642508",
        "primary": false
      }
    ],
    "emails": [],
    "addresses": [],
    "notes": null,
    "reference": null,
    "created_at": "2017-07-27T00:43:43.203Z",
    "updated_at": "2017-09-08T23:13:35.791Z"
  }
]
```

Search the Parakeet contacts directly for contacts matching the query parameters.

### HTTP Request

`GET https://api.parakeet.is/api/v1/contacts`

### Query Parameters

Parameter | Type | Values
--------- | ------- | -----------
query | string | Search contacts by name, title, company, etc
sort | string | One of `relevance`, `name`
handle | string | Search for contacts by an E.164 phone number
limit | number | Number of results to return, max 100.

## Get Contact

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "href": "/api/v1/contacts/CNa402c39f726411e7a2d617b4f2b45fec",
  "id": "CNa402c39f726411e7a2d617b4f2b45fec",
  "title": null,
  "color": "862D0C",
  "display_name": "Mollie Nolan",
  "first_name": "Mollie",
  "middle_name": null,
  "last_name": "Nolan",
  "suffix": null,
  "nickname": null,
  "role": "Denials Analyst",
  "company_name": "HSS",
  "default_image": true,
  "image": {
    "48": "https://static.parakeet.is/images/48.png",
    "64": "https://static.parakeet.is/images/64.png",
    "256": "https://static.parakeet.is/images/256.png",
    "512": "https://static.parakeet.is/images/512.png",
    "original": "https://static.parakeet.is/images/original.png"
  },
  "birth_date": null,
  "time_zone": null,
  "phone_numbers": [
    {
      "label": "Home",
      "country_code": "US",
      "number": "+19167642508",
      "primary": false
    }
  ],
  "emails": [],
  "addresses": [],
  "notes": null,
  "reference": null,
  "created_at": "2017-07-27T00:43:43.203Z",
  "updated_at": "2017-09-08T23:13:35.791Z"
}
```

Fetches a specific contact by its identifier.

### HTTP Request

`GET https://api.parakeet.is/api/v1/contacts/{id}`