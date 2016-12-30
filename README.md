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

####  rake db:seeds - to try this app locally

##  API endpoints

#### 1.  get all events, created by user. Given user :id.
####     GET http://localhost:3000/v1/users/2
#####    Response: 
         { "user":
             { "username": "Peter" },
           "user_events": [
             { "start":null,
               "stop":null,
                "duration":1,
                "name":"Lunch",
                "description":"Lunch in fine restaurant near Coliseum",
                "markdown_description":"",
                "location":"Rome",
                "published":false,
                "deleted":false
                },
             { "start":null,
               "stop":null,
               "duration":3,
               "name":"Weekend",
               "description":"Great weekend of the whole team",
               "markdown_description":"",
               "location":"Paris",
               "published":true,
               "deleted":false
               } ],
           "code":200,
           "status":"success" 
         }
         
#### 2. create event - post new event, by user. Given username.
####    POST http://localhost:3000/v1/group_events
#####   Params: 
        start:2017-01-02T22:00:00.000Z
        duration:4
        name:Holiday
        location:Saint-Petersburg
        user_id:3
        published:false
        description:Nice and wondeful holiday
        deleted:false

#####   Response: 
		{
		  "id": 15,
		  "user_id": 3,
		  "start": "2017-01-02T22:00:00.000Z",
		  "stop": "2017-01-06T22:00:00.000Z",
		  "duration": 4,
		  "name": "Holiday",
		  "description": "Nice and wondeful holiday",
		  "markdown_description": null,
		  "location": "Saint-Petersburg",
		  "published": false,
		  "deleted": false,
		  "created_at": "2016-12-30T16:15:06.868Z",
		  "updated_at": "2016-12-30T16:15:06.868Z"
		}
##### Start time and Duration of Event - are in input params.
##### Stop time calculated.
##### To create Event following fields are required: 
#####   :user_id, :start, :duration, :name 

#### 3. update event - post new event, by user. Given username.
####    PUT http:http://localhost:3000/v1/group_events/7
#####   Params: 
		description:Big conference
		duration:20
		
#####   Response: 
		{"id":7,"user_id":3,
		"start":"2017-01-02T22:00:00.000Z",
		"stop":"2017-01-22T22:00:00.000Z",
		"duration":20,"name":"Holiday",
		"description":"Big conference",
		"markdown_description":"",
		"location":"Saint-Petersburg",
		"published":true,"deleted":false,"users":null}

#### 4. Standart REST calls:
#### 4.1. GET  http://localhost:3000/v1/group_events - display all events exists
#### 4.2. GET  http://localhost:3000/v1/group_events/4 - show one event with id=4
#####   Response: 
        {"id":4,"user_id":1,
        "start":"2017-03-05T14:30:00.000Z",
        "stop":"2017-03-10T19:00:00.000Z",
        "duration":5,"name":"",
        "description":"Fine meeting with developers in office",
        "markdown_description":"",
        "location":"Tokyo","published":false,
        "deleted":false,"users":null}
        

#### ----------------------------------------------------------------

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
