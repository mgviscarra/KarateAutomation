Feature: sample karate test script

Background:

#* def nameitem='NameItem783'
* def token = call read('basic-auth.js') { username: 'nmelgarejc@gmail.com', password: 'nmelgarejc' }
* url 'https://todo.ly/api/'


Given path '/items.json'
And header Authorization = token
And  request {"Content": "3385"}
When method post
Then status 200

* def id = response.Id
* def jsonReturn = response
* set jsonReturn.LastSyncedDateTime = '#ignore'

Scenario: Create a Item 

Given path 'items/'+id+'.json'
And header Authorization = token
When method get
And set response.LastSyncedDateTime = '#ignore'
Then match response  ==  jsonReturn


Scenario: Put a Item 

Given path 'items/'+id+'.json'
And header Authorization = token
And  request {"Checked": true}
When method put
Then status 200
And  set jsonReturn.Checked = true
And  set jsonReturn.InHistory = true
And  set response.LastCheckedDate = '#ignore'
And  set jsonReturn.LastCheckedDate = '#ignore'
And  set response.LastUpdatedDate = '#ignore'
And  set jsonReturn.LastUpdatedDate = '#ignore'
Then match response  ==  jsonReturn


Scenario: Delete a -item 

Given path 'items/'+id+'.json'
And header Authorization = token
When method delete
Then status 200
And  set response.LastUpdatedDate = '#ignore'
And  set jsonReturn.LastUpdatedDate = '#ignore'
And  set jsonReturn.Deleted = true
Then match response  == jsonReturn

