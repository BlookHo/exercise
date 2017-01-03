# README
######--------------------------------------------------------------------------

## Background:

* A group event will be created by an user.
* The group event should run for a whole number of days e.g.. 30 or 60.
* There should be attributes to set and update the start, end or duration of the event
(and calculate the other value).
* The event also has a
  name,
  description (which supports formatting), ( ?? format: { with: /\A[a-zA-Z]+\z/,
                                                  message: "only allows letters" } ?? )
  location.
 
* The event should be draft or published.
* To publish all of the fields are required,
  it can be saved with only a subset of fields before it’s published.
* When the event is deleted/remove it should be kept in the database and marked as such.

## Deliverable:
* Write an AR model, spec and migration for a GroupEvent
that would meet the needs of the description above.
 
* Then write the api controller and spec to
support JSON request/responses to manage these GroupEvents.

For the purposes of this exercise, ignore auth.

* Please provide your solution as a rails app called exercise_YYMMDD_yourname,
sent as a zip file.

###### --------------------------------------------------------------------------


##  API endpoints

#### 1.  Standart REST calls:
#### 1.1 get one user and all events, created by user. Given user :id.
####     GET http://localhost:3000/v1/users/1 - show one user with id=1 and all his events
#####    Response: 
		{
		  "username": "Aleksei",
		  "email": "zoneiva@gmail.com",
		  "group_events": [
			{
			  "id": 3,
			  "user_id": 1,
			  "start": "2017-02-15T10:00:00.000Z",
			  "stop": "2017-02-25T10:00:00.000Z",
			  "duration": 10,
			  "name": "Coding",
			  "description": "#### Developing of main * Back-end * Front end * Server tech in Project#22 in office",
			  "markdown_description": "<h4>Developing of main * Back-end * Front end * Server tech in Project#22 in office</h4>\n",
			  "location": "Minsk",
			  "published": false,
			  "deleted": true,
			  "users": null
			},
			{
			  "id": 7,
			  "user_id": 1,
			  "start": "2017-04-20T12:30:00.000Z",
			  "stop": "2017-04-24T12:30:00.000Z",
			  "duration": 4,
			  "name": "React Conference",
			  "description": null,
			  "markdown_description": "",
			  "location": "New York",
			  "published": false,
			  "deleted": true,
			  "users": null
			},
			{
			  "id": 5,
			  "user_id": 1,
			  "start": "2017-01-25T11:00:00.000Z",
			  "stop": "2017-03-21T11:00:00.000Z",
			  "duration": 55,
			  "name": "Startup Launch",
			  "description": "#### Launch of new startup according to the [Project_15.com]",
			  "markdown_description": "<h4>Launch of new startup according to the [Project_15.com]</h4>\n",
			  "location": "Boston",
			  "published": false,
			  "deleted": false,
			  "users": null
			}
		  ]
		}
		
#### 1.2 get all users:
####     GET http://localhost:3000/v1/users/
#####   Response: 

		{
		  "users": [
			{
			  "id": 1,
			  "username": "Aleksei",
			  "email": "zoneiva@gmail.com"
			},
			{
			  "id": 2,
			  "username": "Peter",
			  "email": "cts@gmail.com"
			},
			{
			  "id": 3,
			  "username": "Ann",
			  "email": "anna@mail.ru"
			},
			{
			  "id": 4,
			  "username": "Example User",
			  "email": "example@railstutorial.org"
			},
			{
			  "id": 5,
			  "username": "Feodor",
			  "email": "fedor@yandex.ru"
			}
		  ]
		}

#### 1.3 no user with id:
####     GET http://localhost:3000/v1/users/6
#####   Response: 

		
		{
		  "error": "No such record in Database; check params",
		  "status": "not_found"
		}

#### 1.4. GET  http://localhost:3000/v1/group_events   - display all events exists
#####   Response: 

		{
		  "group_events": [
			{
			  "id": 3,
			  "user_id": 1,
			  "start": "2017-02-15T10:00:00.000Z",
			  "stop": "2017-02-25T10:00:00.000Z",
			  "duration": 10,
			  "name": "Coding",
			  "description": "#### Developing of main * Back-end * Front end * Server tech in Project#22 in office",
			  "markdown_description": "<h4>Developing of main * Back-end * Front end * Server tech in Project#22 in office</h4>\n",
			  "location": "Minsk",
			  "published": false,
			  "deleted": true
			},
			{
			  "id": 4,
			  "user_id": 2,
			  "start": "2017-02-10T09:00:00.000Z",
			  "stop": "2017-02-13T09:00:00.000Z",
			  "duration": 3,
			  "name": "Weekend",
			  "description": "#### Great weekend of the whole team",
			  "markdown_description": "<h4>Great weekend of the whole team</h4>\n",
			  "location": "false",
			  "published": false,
			  "deleted": false
			},
			{
			  "id": 1,
			  "user_id": 3,
			  "start": "2017-01-02T22:00:00.000Z",
			  "stop": "2017-01-06T22:00:00.000Z",
			  "duration": 4,
			  "name": "Holiday",
			  "description": "Our  Fine   meeting with developers in office [www.blog.com](my_email@google.com)!",
			  "markdown_description": "<p>Our  Fine   meeting with developers in office <a href=\"my_email@google.com\">www.blog.com</a>!</p>\n",
			  "location": "Saint-Petersburg",
			  "published": true,
			  "deleted": true
			},
		
		.....


#### 1.5. GET  http://localhost:3000/v1/group_events/4 - show one event with id=4
#####   Response: 

		{
		  "id": 4,
		  "user_id": 2,
		  "start": "2017-02-10T09:00:00.000Z",
		  "stop": "2017-02-13T09:00:00.000Z",
		  "duration": 3,
		  "name": "Weekend",
		  "description": "#### Great weekend of the whole team",
		  "markdown_description": "<h4>Great weekend of the whole team</h4>\n",
		  "location": "false",
		  "published": false,
		  "deleted": false,
		  "users": null
		}

#### 1.3 no group_event with id:
####     GET http://localhost:3000/v1/users/15
#####   Response: 

		{
		  "error": "No such record in Database; check params",
		  "status": "not_found"
		}


#### 2. create event - post new event, by user. Given username.
####    POST http://localhost:3000/v1/group_events
#####   Params: 
        start:2017-01-02T22:00:00.000Z
        duration:4
        name:Holiday
        location:Saint-Petersburg
        user_id:3
        description:### Nice and wondeful holiday

#####   Response: 
		{
		  "id": 15,
		  "user_id": 3,
		  "start": "2017-01-02T22:00:00.000Z",
		  "stop": "2017-01-06T22:00:00.000Z",
		  "duration": 4,
		  "name": "Holiday",
		  "description": "Nice and wondeful holiday",
		  "markdown_description": '<h4>Nice and wondeful holiday</h4>',
		  "location": "Saint-Petersburg",
		  "published": false,
		  "deleted": false,
		  "created_at": "2016-12-30T16:15:06.868Z",
		  "updated_at": "2016-12-30T16:15:06.868Z"
		}
##### Start time and Duration of Event - are in input params.
##### Stop time calculated - according to rules.
##### To create Event following fields are required: 
#####   :user_id, :start, :duration, :name 

#### 3. update event - post new event, by user. Given username.
####    PUT http:http://localhost:3000/v1/group_events/7
#####   Params: 
		"description":"Fine meeting with developers in office [www.blog.com](my_email@google.com)!",
		duration:20
		
#####   Response: 
		{"id":7,"user_id":3,
		"start":"2017-01-02T22:00:00.000Z",
		"stop":"2017-01-22T22:00:00.000Z",
		"duration":20,"name":"Holiday",
		"description":"Fine meeting with developers in office [www.blog.com](my_email@google.com)!",
		"markdown_description":"<p>Fine meeting with developers in office <a href=\"my_email@google.com\">www.blog.com</a>!</p>\n",
		"location":"Saint-Petersburg",
		"published":true,"deleted":false,"users":null}

###### Above - markdown forrmatted field markdown_description was created - to be displayed in front end.


#### 5. DELETE  http://localhost:3000/v1/remove?id=3 - mark  event as deleted
#####   Response: 
		{
		  "deleted_event": {
			"deleted": true,
			"id": 3,
			"user_id": 1,
			"start": "2017-02-15T10:00:00.000Z",
			"stop": "2017-02-25T10:00:00.000Z",
			"duration": 10,
			"name": "Coding",
			"description": "#### Developing of main * Back-end * Front end * Server tech in Project#22 in office",
			"markdown_description": "<h4>Developing of main * Back-end * Front end * Server tech in Project#22 in office</h4>\n",
			"location": "Minsk",
			"published": false
		  },
		  "code": 200,
		  "status": "success"
		}
		 

##### If event already deleted - response:
		{
		  "deleted_event": [],
		  "deleted_already": {
			"error": "Action already done",
			"code": 304,
			"status": "not_modified"
		  }
		}


#### 6. PUT  http://localhost:3000/v1/publish?id=1 - mark  event as published 
####         if all fields are not nil - according to rules.

#####   Response: 
		{
		  "published_event": {
			"published": true,
			"id": 1,
			"user_id": 3,
			"start": "2017-01-02T22:00:00.000Z",
			"stop": "2017-01-06T22:00:00.000Z",
			"duration": 4,
			"name": "Holiday",
			"description": "Our  Fine   meeting with developers in office [www.blog.com](my_email@google.com)!",
			"markdown_description": "<p>Our  Fine   meeting with developers in office <a href=\"my_email@google.com\">www.blog.com</a>!</p>\n",
			"location": "Saint-Petersburg",
			"deleted": true
		  },
		  "code": 200,
		  "status": "success"
		}

##### If event already published - response:
		{
		  "published_event": [],
		  "published_already": {
			"error": "Action already done",
			"code": 304,
			"status": "not_modified"
		  }
		}

##### If event can not be published (at least one field == nil)- response:
#####   GET http://localhost:3000//v1/publish?id=9
#####   Response: 
		{
		  "published_event": [],
		  "published_forbidden": {
			"base": [
			  "Event can not be published - has nil in fields"
			]
		  }
		}

#### ----------------------------------------------------------------

This application details:

* Ruby version - 2.3.1

* System dependencies - rails 5.0.1

* Configuration - api

* Database creation - Postgresql

* Database initialization - according database.yml + secrets.yml (role, createdb, password)
#####  rake db:migrate
#####  rake db:seeds

* How to run the test suite - bundle exec guard

* Deployment instructions - yet now
