

# Group Comments


## Comments [/comments]


### List of comments [GET /api/v1/tasks/{task_id}/comments]

+ Parameters
    + task_id: `1378` (number, required)

+ Request returns comments
**GET**&nbsp;&nbsp;`/api/v1/tasks/1378/comments`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDYwOTAxNTUsInVzZXJfaWQiOjI2NzUsInVpZCI6IjQ4MTIwNTI2LWI1YWUtNDAwZC05ZDU2LWU5ZjhhZTk1MDRiMSIsInJ1aWQiOiJiN2YyNTAxMS02NDg5LTRhMzItYTFiZi1iYzdlZmQ5NTZiNjcifQ.hCi8HmX03eInYIlkEvYCda0PIFwE5-79XR01WEpn0gg
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "277",
                  "type": "comment",
                  "attributes": {
                    "body": "Non et ipsa reiciendis veritatis blanditiis.",
                    "image": "memory://d7076c38ea9f9d7094199ff534a5c22f.jpg"
                  }
                },
                {
                  "id": "278",
                  "type": "comment",
                  "attributes": {
                    "body": "Quia ad est libero dolore sunt dolorem mollitia.",
                    "image": "memory://d00ac74cd3bee96b68a2d59ad48bab2b.jpg"
                  }
                },
                {
                  "id": "279",
                  "type": "comment",
                  "attributes": {
                    "body": "Adipisci eos aut in expedita.",
                    "image": "memory://315c48751fcf8a49c7d1710e90b4f6fc.jpg"
                  }
                }
              ]
            }

### Create a comment [POST /api/v1/tasks/{task_id}/comments]

+ Parameters
    + task_id: `1379` (number, required)

+ Request returns comment
**POST**&nbsp;&nbsp;`/api/v1/tasks/1379/comments`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDYwOTAxNTYsInVzZXJfaWQiOjI2NzksInVpZCI6ImYzNjI0YjQxLWU1YzYtNDQ5Mi1iMTUxLTBhNDQwOTEzMzljNCIsInJ1aWQiOiIyZDQ3YzgyNy0xYmFiLTRmOTEtYmVhZi02MTNjYWI0NDQ4NDAifQ.7kG59jU8ml3XRg9aYLk37HNsuV4maQlCB883wdWtKkg
            Content-Type: application/x-www-form-urlencoded

    + Body

            body=Provident+in+aliquam+quas+aut+dolore+alias+veniam+consequatur.

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "280",
                "type": "comment",
                "attributes": {
                  "body": "Provident in aliquam quas aut dolore alias veniam consequatur.",
                  "image": null
                }
              }
            }

### Destroy a comment [DELETE /api/v1/comments/{id}]

+ Parameters
    + id: `281` (number, required)

+ Request returns http no content status
**DELETE**&nbsp;&nbsp;`/api/v1/comments/281`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDYwOTAxNTYsInVzZXJfaWQiOjI2ODAsInVpZCI6Ijc4NjA3MWIyLTM0YzQtNGU3Zi05ZGRiLWYxOWQ1NWVlNzk4MyIsInJ1aWQiOiJiOWVhYTFiYS1iZWZlLTRhNDYtYjdiOS0yZWZmMmJiNzI1ZDgifQ.fQCDi1umcbf67E5rgDsZJQD02Iv5eQFn5SSaScKqwb8
            Content-Type: application/json

+ Response 204

# Group Projects


## Projects [/projects]


### List of projects [GET /api/v1/projects]


+ Request returns projects
**GET**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDYwOTAxNTYsInVzZXJfaWQiOjI2ODEsInVpZCI6ImE2MzcxYWVjLWY5NWEtNDYzNC05ODJjLWYwMTVkZGVkYmQ1YiIsInJ1aWQiOiJiN2M3MzgzOC00ZTcwLTQ4MjQtYWY5NC0yNTMyMmIyMDlhY2YifQ.mfkTRNqc4aRiwGQrAhaZsRGgheFEOXykus3Qh70_pCo
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
            
              ]
            }

### Project details [GET /api/v1/projects/{id}]

+ Parameters
    + id: `1919` (number, required)

+ Request returns project
**GET**&nbsp;&nbsp;`/api/v1/projects/1919`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDYwOTAxNTYsInVzZXJfaWQiOjI2ODIsInVpZCI6ImU2OTMyZjUyLTEzN2MtNDc5Yy05MTBkLTc4MWI0MTMwNmUwMCIsInJ1aWQiOiI4YzZlYWI0ZS05NjgyLTQxNmQtYjljMC1kMTMzYTkxMzFjODAifQ.Y4aioIbTvaNJ9vhLJCFTnAloGaBC9NQXRtNvV06GLLA
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1919",
                "type": "project",
                "attributes": {
                  "name": "Traveller"
                },
                "relationships": {
                  "tasks": {
                    "data": [
            
                    ]
                  },
                  "user": {
                    "data": {
                      "id": "2682",
                      "type": "user"
                    }
                  }
                },
                "links": {
                  "self": "http://localhost:3000/api/v1/projects/1919"
                }
              }
            }

### Update a object [PATCH /api/v1/projects/{id}]

+ Parameters
    + id: `1920` (number, required)

+ Request returns project
**PATCH**&nbsp;&nbsp;`/api/v1/projects/1920`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDYwOTAxNTYsInVzZXJfaWQiOjI2ODMsInVpZCI6IjNhZThhNjk4LTY5ZGItNGUxNS05NjIyLWRhOGVkYTk3ODRiYyIsInJ1aWQiOiI2OTllNGI1Mi1kOWUyLTQ5MGMtYjU1ZC1kZmJhMjY2ZDMwZDAifQ.6TXMXUyFxU9xNoOqPQ9eChm8veIhLAG7_bm4VQe01RA
            Content-Type: application/json

    + Body

            {
              "name": "Can't Get Enough Of Myself"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1920",
                "type": "project",
                "attributes": {
                  "name": "Can't Get Enough Of Myself"
                },
                "relationships": {
                  "tasks": {
                    "data": [
            
                    ]
                  },
                  "user": {
                    "data": {
                      "id": "2683",
                      "type": "user"
                    }
                  }
                },
                "links": {
                  "self": "http://localhost:3000/api/v1/projects/1920"
                }
              }
            }

### Create a project [POST /api/v1/projects]


+ Request returns project
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDYwOTAxNTYsInVzZXJfaWQiOjI2ODQsInVpZCI6ImE4ZTc4M2Y3LWM5MzEtNDgwMC05MDczLTVmNTU0OWI2ZTMwYyIsInJ1aWQiOiJjNDI3Zjg0Mi0zMzBlLTQwODctODJiNy04ODZhMzExY2ZkYmEifQ.7lYcAaA6TD4x9KxZEk4MNlqqw5b0PwWimfkAZxq7Iuc
            Content-Type: application/json

    + Body

            {
              "name": "Ex's & Oh's"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1921",
                "type": "project",
                "attributes": {
                  "name": "Ex's & Oh's"
                },
                "relationships": {
                  "tasks": {
                    "data": [
            
                    ]
                  },
                  "user": {
                    "data": {
                      "id": "2684",
                      "type": "user"
                    }
                  }
                },
                "links": {
                  "self": "http://localhost:3000/api/v1/projects/1921"
                }
              }
            }

### Destroy a project [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `1922` (number, required)

+ Request returns http no content status
**DELETE**&nbsp;&nbsp;`/api/v1/projects/1922`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDYwOTAxNTYsInVzZXJfaWQiOjI2ODUsInVpZCI6ImMxMGM3MTZhLTJjMjctNDdmNy1iMGM1LTVlOWM0NTRkOTYyZSIsInJ1aWQiOiIzOTNlODM1Zi0zZWYyLTQ3NDItYTNmZC00YjNiMmE3OTZhMTkifQ.bWJCBh7mjgAvY809KSbSK-j0f8xmzy6fqm_URigFpTQ
            Content-Type: application/json

+ Response 204

# Group Registrations


## Registrations [/auth]


### Create user [POST /api/v1/auth]


+ Request returns created user
**POST**&nbsp;&nbsp;`/api/v1/auth`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "username": "edda_ryan",
              "password": "ALynaBKqz8_r6DM",
              "password_confirmation": "ALynaBKqz8_r6DM"
            }

+ Response 201

    + Headers

            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDYwOTAxNTUsInVzZXJfaWQiOjI2NzIsInVpZCI6IjhiZTgyYjM4LTIyNmUtNDkyNi04ZGQzLTM1ZDE5ZTUyY2NhOCIsInJ1aWQiOiIwZWEwMzExNC00ZWIwLTRkOTktYTZkNy0zNzdkOWNjMDY2MDIifQ.2svPLnOdjIMUXgDnaPr5BGZshgkF8nEoJ9zmJx90UEA
            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2672",
                "type": "user",
                "attributes": {
                  "username": "edda_ryan",
                  "provider": null,
                  "uid": null,
                  "created_at": "2020-11-22T23:09:15.610Z",
                  "updated_at": "2020-11-22T23:09:15.610Z"
                }
              }
            }

# Group Sessions


## Sessions [/auth]


### Create session [POST /api/v1/auth/sign_in]


+ Request returns user
**POST**&nbsp;&nbsp;`/api/v1/auth/sign_in`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "username": "sharron_bogan",
              "password": "WCbuztId3c"
            }

+ Response 200

    + Headers

            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDYwOTAxNTUsInVzZXJfaWQiOjI2NzMsInVpZCI6IjFjNTViMjQyLWIzMGEtNGE2ZC1hYTg4LWQzZTM4YmRlYzVkOCIsInJ1aWQiOiJlZDBiYTZiMy1jMDM3LTQ2MmUtOTVlMi0xNTk5MDNiNDhhOGQifQ._pf8R80NlJad-Er0IxhgXfw8R7QckLzsWz_OfoSS9aI
            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2673",
                "type": "user",
                "attributes": {
                  "username": "sharron_bogan",
                  "provider": null,
                  "uid": null
                }
              }
            }

### Destroy session [DELETE /api/v1/auth/sign_out]


+ Request returns success message
**DELETE**&nbsp;&nbsp;`/api/v1/auth/sign_out`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDYwOTAxNTUsInVzZXJfaWQiOjI2NzQsInVpZCI6IjVlYjgwYmIwLTQyNDEtNDhmYy05ODM5LTY1ZjkxZTcyODY2NyIsInJ1aWQiOiIyYzc3MzQ5Ni1kNDU3LTRmYWUtODI1ZS04MDQ1ZTRlMDYyMDEifQ.WPgyvf09Vo0_zhnrgPLNH1LYMB-Qe3CtmoDHztfZv8o
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "success": true
            }

# Group Tasks


## Tasks [/tasks]


### List of tasks [GET /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `1926` (number, required)

+ Request returns tasks
**GET**&nbsp;&nbsp;`/api/v1/projects/1926/tasks`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDYwOTAxNTYsInVzZXJfaWQiOjI2ODYsInVpZCI6IjUyMWE2OWQ1LThmNDEtNGZlMC05ZDExLTM2YzEzYWUwNTllNiIsInJ1aWQiOiIyNmZlMGI4Yy1mOTA1LTRhYzItYjQ4ZC0yODVhYzNiYTIzZGMifQ.SVwuUBP6TXOmLm_bitQ1O2P-Dxg8DWRL-mScT124FWM
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "1383",
                  "type": "task",
                  "attributes": {
                    "name": "What's Inside",
                    "position": 1,
                    "due_date": "2020-11-24T00:00:00.000Z",
                    "done": false
                  },
                  "relationships": {
                    "comments": {
                      "data": [
            
                      ]
                    }
                  }
                },
                {
                  "id": "1382",
                  "type": "task",
                  "attributes": {
                    "name": "Facts",
                    "position": 2,
                    "due_date": "2020-11-24T00:00:00.000Z",
                    "done": false
                  },
                  "relationships": {
                    "comments": {
                      "data": [
            
                      ]
                    }
                  }
                },
                {
                  "id": "1381",
                  "type": "task",
                  "attributes": {
                    "name": "Watch Me Whip",
                    "position": 3,
                    "due_date": "2020-11-24T00:00:00.000Z",
                    "done": false
                  },
                  "relationships": {
                    "comments": {
                      "data": [
            
                      ]
                    }
                  }
                }
              ]
            }

### Task details [GET /api/v1/tasks/{id}]

+ Parameters
    + id: `1384` (number, required)

+ Request returns task
**GET**&nbsp;&nbsp;`/api/v1/tasks/1384`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDYwOTAxNTYsInVzZXJfaWQiOjI2OTAsInVpZCI6IjdlZTgyZTc4LTY2MDgtNDA3My04OTljLTUzYWZhOTExYjczOSIsInJ1aWQiOiIyZjE4ZWE3Zi0wNDk4LTQ1NmEtYjYxNC0xZTgwYzQ0ZjQyMWQifQ.EbGK79eIMYiX2zih836dpYw-KZUFLwuzuiQ1CsN93-8
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1384",
                "type": "task",
                "attributes": {
                  "name": "Girl Money Gone the Money Hunger Games",
                  "position": 1,
                  "due_date": "2020-11-24T00:00:00.000Z",
                  "done": false
                },
                "relationships": {
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

### Update a task [PATCH /api/v1/tasks/{id}]

+ Parameters
    + id: `1385` (number, required)

+ Request returns task
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/1385`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDYwOTAxNTYsInVzZXJfaWQiOjI2OTEsInVpZCI6ImZjNmY5ZmYzLTBiOTItNDYwZC05ZDQxLTRkNzQyY2RhNzZmNyIsInJ1aWQiOiIyNDMwOWUxNi01ZDdkLTRjYmItYjQ1Yi05ZTdjOTJlNDNkN2EifQ.kK9eK3XYbwHaq1H37Dp7REJREG1BAGxlh9n9UDsbfhk
            Content-Type: application/json

    + Body

            {
              "name": "Like I'm Gonna Lose You",
              "due_date": "2020-11-24"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1385",
                "type": "task",
                "attributes": {
                  "name": "Like I'm Gonna Lose You",
                  "position": 1,
                  "due_date": "2020-11-24T00:00:00.000Z",
                  "done": false
                },
                "relationships": {
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

### Create a task [POST /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `1930` (number, required)

+ Request returns task
**POST**&nbsp;&nbsp;`/api/v1/projects/1930/tasks`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDYwOTAxNTYsInVzZXJfaWQiOjI2OTMsInVpZCI6IjQyMThkZDMwLWEwYmQtNGFmZi1iY2E2LWI3YjJhYWY0MGUzMCIsInJ1aWQiOiJkYjU2YjZkMy1iYjMyLTQ3Y2YtODA4YS1hNDQ4ODk1ZTMzNjQifQ.WibGlUI1wtbPlgPKjbC-5IbbG-kbPEs7qcju8fcYms0
            Content-Type: application/json

    + Body

            {
              "name": "The Hills"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1386",
                "type": "task",
                "attributes": {
                  "name": "The Hills",
                  "position": 1,
                  "due_date": null,
                  "done": false
                },
                "relationships": {
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

### Destroy a task [DELETE /api/v1/tasks/{id}]

+ Parameters
    + id: `1387` (number, required)

+ Request returns http no content status
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/1387`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDYwOTAxNTYsInVzZXJfaWQiOjI2OTUsInVpZCI6IjI1ZjViMzYzLTRlOWEtNDRmMy04Njk1LTBiYzk1ZThlNTFjYiIsInJ1aWQiOiI3YjNkNWYyZC1kNjlhLTQxMDItODNkOS1jODA4ZWE5MWViYmEifQ.1smupiHWwsdoS_X6eQ4v_mJ2Q4QbeO8NGPpc-8Md1qo
            Content-Type: application/json

+ Response 204

### Compelete a task [PATCH /api/v1/tasks/{task_id}/complete]

+ Parameters
    + task_id: `1388` (number, required)

+ Request returns task
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/1388/complete`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDYwOTAxNTcsInVzZXJfaWQiOjI2OTYsInVpZCI6IjUwNWRjZjllLWQ4MGEtNGZmYS04MWRmLTAxZjFhNThmODVlYiIsInJ1aWQiOiIxNzllOGZiZS0wYTg3LTQxYWYtYjMwZi1jNjFiY2UyNjFjOTYifQ.ttihXhHCJP6w0rHbDdgkhmLCfFoPWghcGLaXlhL-J3Y
            Content-Type: application/json

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1388",
                "type": "task",
                "attributes": {
                  "name": "On Me",
                  "position": 1,
                  "due_date": "2020-11-24T00:00:00.000Z",
                  "done": true
                },
                "relationships": {
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

### Change task position [PATCH /api/v1/tasks/{task_id}/position]

+ Parameters
    + task_id: `1392` (number, required)

+ Request returns position
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/1392/position`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDYwOTAxNTcsInVzZXJfaWQiOjI2OTcsInVpZCI6ImIzMThmOTE5LTBlNGEtNGY3OC05YTFkLTc4ZmQ2MTUyMzJhYiIsInJ1aWQiOiJmMWI2OTFjYi02NzIwLTQ5YjktYmZiZi1hY2UxOGNhMTk5OGMifQ.rGTeZtmhWCeGQ0JPG2Rs6_wKm-_0PfF9Bdmt0KEm6mE
            Content-Type: application/json

    + Body

            {
              "position": "down"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1392",
                "type": "position",
                "attributes": {
                  "position": 4
                }
              }
            }
