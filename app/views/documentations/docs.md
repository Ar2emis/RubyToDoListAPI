

# Group Comments


## Comments [/comments]


### List of comments [GET /api/v1/tasks/{task_id}/comments]

+ Parameters
    + task_id: `2125` (number, required)

+ Request returns comments
**GET**&nbsp;&nbsp;`/api/v1/tasks/2125/comments`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDQ1MzU3ODIsInVzZXJfaWQiOjM3MjcsInVpZCI6ImMwN2ZiNzU1LWRmZTgtNDE4OS04MDAwLTJiNmY1OTM5YTgxNCJ9.tj3sm8XC50qJfWNlWBj2mjBi1M4vKfbs6vvJC89U0GY
            X-Refresh-Token: eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDUxMzY5ODIsInVzZXJfaWQiOjM3MjcsInVpZCI6ImYxNGFmZDhhLTgxMGQtNDgzYi05ZjhkLTdjNTNhODVhODZkNyJ9.0cxKV58xY4ldVh2yqEkb372GupxqDu_NWipiuBUi1-U
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "276",
                  "type": "comment",
                  "attributes": {
                    "body": "Est qui vero et harum id ad tempore.",
                    "image": "memory://03a0f2f8e3693061a632180e8ecfba98.jpg"
                  }
                },
                {
                  "id": "277",
                  "type": "comment",
                  "attributes": {
                    "body": "Ratione iste assumenda ex eum.",
                    "image": "memory://49d1a4015ac28f2ba65f845b679e392d.jpg"
                  }
                },
                {
                  "id": "278",
                  "type": "comment",
                  "attributes": {
                    "body": "Dolorem accusamus aperiam officia maxime nisi eum et.",
                    "image": "memory://d8a2e5ce3fc32927dc9b79e1547c1498.jpg"
                  }
                }
              ]
            }

### Create a comment [POST /api/v1/tasks/{task_id}/comments]

+ Parameters
    + task_id: `2126` (number, required)

+ Request returns comment
**POST**&nbsp;&nbsp;`/api/v1/tasks/2126/comments`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDQ1MzU3ODMsInVzZXJfaWQiOjM3MjgsInVpZCI6ImI3MDJhN2YxLWVkMmEtNDU0Mi1iYjA2LWVkYjNkMzdjZjk4MSJ9.sUm0WiOXPtYHqdJSfs3x7c48mqBhIbcDhErmC-7JeH4
            X-Refresh-Token: eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDUxMzY5ODMsInVzZXJfaWQiOjM3MjgsInVpZCI6ImE5NWE2Mzg3LWE5M2UtNDdkNC05ODNiLWM3NjRlM2ExNTZmNiJ9.Te7dWcQuwwXqD3MLbetH2F5_D_837njW_v3flzGyeZc
            Content-Type: multipart/form-data; boundary=----------XnJLe9ZIbbGUYtzPQJ16u1

    + Body

            {
              "data": {
                "body": "Et similique necessitatibus quibusdam est non ut.",
                "image": {
                  "filename": "image.jpg",
                  "type": "image/jpeg",
                  "name": "data[image]",
                  "tempfile": "#<File:0x0000561774ac65e8>",
                  "head": "Content-Disposition: form-data; name=\"data[image]\"; filename=\"image.jpg\"\r\nContent-Type: image/jpeg\r\nContent-Length: 296059\r\n"
                }
              }
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": {
                "image": [
                  "type must be one of: image/jpeg, image/png"
                ]
              }
            }

### Destroy a comment [DELETE /api/v1/comments/{id}]

+ Parameters
    + id: `279` (number, required)

+ Request returns http no content status
**DELETE**&nbsp;&nbsp;`/api/v1/comments/279`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDQ1MzU3ODMsInVzZXJfaWQiOjM3MjksInVpZCI6Ijc1MGU1N2FmLTAxODgtNDhmMy1iZmJhLWRmODZjMDkwNjVkMiJ9.4Gi3BGV3EVpmw7JSSQZOQSdTRK3J3dDFKIGNLZoHLyo
            X-Refresh-Token: eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDUxMzY5ODMsInVzZXJfaWQiOjM3MjksInVpZCI6ImQwMjA0YTRjLWRmMzctNDY1MS05ZjgwLTg0MTFkNTVlMzk0NyJ9.LwjMp2PurTfVRC8yYCfUjxJAC99wpEH2bFGlzlnWtiU
            Content-Type: application/json

+ Response 204

# Group Projects


## Projects [/projects]


### List of projects [GET /api/v1/projects]


+ Request returns projects
**GET**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDQ1MzU3ODMsInVzZXJfaWQiOjM3MzAsInVpZCI6ImQ3YjI0MDIxLTI0MzktNDRjYi04ZmMxLTQ5Y2U3YWNkMjZhMSJ9.A_IM8CISjayA3-s-bDGSDxQwMek1tgnhqJWkUSAA6_0
            X-Refresh-Token: eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDUxMzY5ODMsInVzZXJfaWQiOjM3MzAsInVpZCI6IjcyZGQ0MWM2LTc3MDQtNDE2YS1iNzc3LTdjY2FiM2IyMzZmNyJ9.fKzJgCU2FrvUhSMCnXqCysTTwv1SeNloIqgiqPQjJaM
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "3098",
                  "type": "project",
                  "attributes": {
                    "name": "The Hills"
                  },
                  "relationships": {
                    "tasks": {
                      "data": [
            
                      ]
                    },
                    "user": {
                      "data": {
                        "id": "3730",
                        "type": "user"
                      }
                    }
                  },
                  "links": {
                    "self": "http://localhost:3000/api/v1/projects/3098"
                  }
                },
                {
                  "id": "3099",
                  "type": "project",
                  "attributes": {
                    "name": "Tennessee Whiskey"
                  },
                  "relationships": {
                    "tasks": {
                      "data": [
            
                      ]
                    },
                    "user": {
                      "data": {
                        "id": "3730",
                        "type": "user"
                      }
                    }
                  },
                  "links": {
                    "self": "http://localhost:3000/api/v1/projects/3099"
                  }
                },
                {
                  "id": "3100",
                  "type": "project",
                  "attributes": {
                    "name": "No Role Modelz"
                  },
                  "relationships": {
                    "tasks": {
                      "data": [
            
                      ]
                    },
                    "user": {
                      "data": {
                        "id": "3730",
                        "type": "user"
                      }
                    }
                  },
                  "links": {
                    "self": "http://localhost:3000/api/v1/projects/3100"
                  }
                }
              ]
            }

### Project details [GET /api/v1/projects/{id}]

+ Parameters
    + id: `3101` (number, required)

+ Request returns project
**GET**&nbsp;&nbsp;`/api/v1/projects/3101`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDQ1MzU3ODMsInVzZXJfaWQiOjM3MzEsInVpZCI6IjI3MTUxNjk4LTYxNDEtNGM3OC1hYjliLTBhMGNjMjBmOWZiOCJ9.radwYy-_y6uYEYPXLeapOpKRBB_WPw767rpu5XD3uoA
            X-Refresh-Token: eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDUxMzY5ODMsInVzZXJfaWQiOjM3MzEsInVpZCI6ImM0NDA4YjA4LTQ4YjYtNDk3OC1hYzMyLWRmNTdkNWY3OGM1NCJ9.K2ExjCiUNnYtJgEhKkKC7I4bubzlm_nwFZH4KJkTGJc
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "3101",
                "type": "project",
                "attributes": {
                  "name": "New Americana"
                },
                "relationships": {
                  "tasks": {
                    "data": [
            
                    ]
                  },
                  "user": {
                    "data": {
                      "id": "3731",
                      "type": "user"
                    }
                  }
                },
                "links": {
                  "self": "http://localhost:3000/api/v1/projects/3101"
                }
              }
            }

### Update a object [PATCH /api/v1/projects/{id}]

+ Parameters
    + id: `3102` (number, required)

+ Request returns project
**PATCH**&nbsp;&nbsp;`/api/v1/projects/3102`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDQ1MzU3ODMsInVzZXJfaWQiOjM3MzIsInVpZCI6ImNkMDE5YjBkLTAyMDUtNDFmZi1hNmQwLWU3YTk4Y2M4YjIwMSJ9.ueAS7DVWwSfuCqoY8pHyyisG25RkZTbHRMPMH2uP_Yg
            X-Refresh-Token: eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDUxMzY5ODMsInVzZXJfaWQiOjM3MzIsInVpZCI6ImUzZjdjYTQ0LWU1NzAtNDliMi05MWIxLTMxNjk4N2NhMjg0ZCJ9.sSTw5yTMuHJP69j-wwQ1wh015WmN52Z7LhsHnVv-RPg
            Content-Type: application/json

    + Body

            {
              "data": {
                "name": "Renegades"
              }
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "3102",
                "type": "project",
                "attributes": {
                  "name": "Renegades"
                },
                "relationships": {
                  "tasks": {
                    "data": [
            
                    ]
                  },
                  "user": {
                    "data": {
                      "id": "3732",
                      "type": "user"
                    }
                  }
                },
                "links": {
                  "self": "http://localhost:3000/api/v1/projects/3102"
                }
              }
            }

### Create a project [POST /api/v1/projects]


+ Request returns project
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDQ1MzU3ODMsInVzZXJfaWQiOjM3MzMsInVpZCI6ImQxZDYxODM2LTkzNDAtNGQxZS1hOTUyLThmMjQ1ZDJmMDYwNyJ9.jHqtwoJvtSka0y2P0TIMgF4F36cdxnJZQ593Pt4jXeI
            X-Refresh-Token: eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDUxMzY5ODMsInVzZXJfaWQiOjM3MzMsInVpZCI6IjQxMWM3ZjMxLTZjZGItNGI4Zi04ZTgxLTQ5YmE4OWU2MjFkNiJ9.hpghfmPKG35o59MoDWloV-O6afLn38ZTPkI8leEyeAU
            Content-Type: application/json

    + Body

            {
              "data": {
                "name": "Jumpman"
              }
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "3103",
                "type": "project",
                "attributes": {
                  "name": "Jumpman"
                },
                "relationships": {
                  "tasks": {
                    "data": [
            
                    ]
                  },
                  "user": {
                    "data": {
                      "id": "3733",
                      "type": "user"
                    }
                  }
                },
                "links": {
                  "self": "http://localhost:3000/api/v1/projects/3103"
                }
              }
            }

### Destroy a project [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `3104` (number, required)

+ Request returns http no content status
**DELETE**&nbsp;&nbsp;`/api/v1/projects/3104`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDQ1MzU3ODMsInVzZXJfaWQiOjM3MzQsInVpZCI6IjY2ZGE0Y2ZkLTRkNDgtNDg1OS05MWE3LTBjMDg4MGIwYmRhZCJ9.9-C4KPsvy2X7xWJDMgXamoqJMjYPNs0Y4WCzuAvImLs
            X-Refresh-Token: eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDUxMzY5ODMsInVzZXJfaWQiOjM3MzQsInVpZCI6IjExMDg4YjZkLWJlOTYtNGM5Yy05OGEzLWQ5YjEwNjZmNmU0NCJ9.ER1NSNsnQk1_cebtr7PjGroI_TSoG74XjSOyLLeSXxE
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
              "username": "santina",
              "password": "suzfk_pLkDvD",
              "password_confirmation": "suzfk_pLkDvD"
            }

+ Response 201

    + Headers

            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDQ1MzU3ODIsInVzZXJfaWQiOjM3MjMsInVpZCI6ImNjMTJhYWE1LTk4NWMtNGQ1Mi05OGE1LTEyMmM0YzlmZDgyMCJ9.0UwYkTT5szigW_VoeH3W6YNP2A5_Udygq3Nudx5XJCA
            X-Refresh-Token: eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDUxMzY5ODIsInVzZXJfaWQiOjM3MjMsInVpZCI6IjMwNDRiYWJhLWE4MjMtNDZiZC1iOTRiLTc3ZGEyNTI4NTVkMiJ9.VubzWWohFkEcei9S3NBuM2wvKEPlOmIXOZwr6s0jLhI
            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "3723",
                "type": "user",
                "attributes": {
                  "username": "santina",
                  "provider": null,
                  "uid": null,
                  "created_at": "2020-11-04T23:23:02.736Z",
                  "updated_at": "2020-11-04T23:23:02.736Z"
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
              "username": "laila",
              "password": "6vu7k0bid"
            }

+ Response 200

    + Headers

            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDQ1MzU3ODIsInVzZXJfaWQiOjM3MjQsInVpZCI6IjhlMGNhZjVlLTIzNzYtNGM2OC1hOTk3LTA1ZmI3MTRjZTg2NCJ9.iLbhKoI0v_O51BgOCJopCk6tfVXWkx7uYjrusihr0Fg
            X-Refresh-Token: eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDUxMzY5ODIsInVzZXJfaWQiOjM3MjQsInVpZCI6ImVkN2E5NTkzLTU2YjEtNDg4Yi1iZmNlLWY5ZTQ2M2RiOThiZSJ9.XAGVUaEcuPFowxCk0pJv__g45lmiYqVnGNdkFkoYYaI
            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "3724",
                "type": "user",
                "attributes": {
                  "username": "laila",
                  "provider": null,
                  "uid": null
                }
              }
            }

### Refresh session [PATCH /api/v1/auth/refresh]


+ Request returns new access token
**PATCH**&nbsp;&nbsp;`/api/v1/auth/refresh`

    + Headers

            Accept: application/json
            X-Refresh-Token: eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDUxMzY5ODIsInVzZXJfaWQiOjM3MjUsInVpZCI6IjhiNzI4MzNlLWIyODgtNDQwNi04NzdlLWU3MGEwMWZlMWJiZSJ9.dA13xGpKbMNyA1Qoa9TbYs7zEIlOfBsSUM4tUBtCJY4
            Content-Type: application/json

+ Response 201

    + Headers

            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDQ1MzU3ODIsInVzZXJfaWQiOjM3MjUsInVpZCI6ImQ5NDE0ZjU2LTYxYmEtNDJkNi05OGFmLTIzYTMwZTVlNzgyZSJ9.voqWju8uyiX0yw8xaa2fWZdcYE-AUbNz3YZoWdPzmO8
            Content-Type: text/plain; charset=utf-8

### Destroy session [DELETE /api/v1/auth/sign_out]


+ Request returns success message
**DELETE**&nbsp;&nbsp;`/api/v1/auth/sign_out`

    + Headers

            Accept: application/json
            X-Refresh-Token: eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDUxMzY5ODIsInVzZXJfaWQiOjM3MjYsInVpZCI6ImI2YWMzNzliLWQ2MzEtNDM0OC04MDA1LTU0MDExMDVlMGEzYiJ9.smg6DSelABduGyE221tvm1_E-RHERT9MuEioV0nzZ48
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
    + project_id: `3105` (number, required)

+ Request returns tasks
**GET**&nbsp;&nbsp;`/api/v1/projects/3105/tasks`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDQ1MzU3ODMsInVzZXJfaWQiOjM3MzUsInVpZCI6IjViNTg4ODE0LTEzMjEtNGQwMS05M2RhLWI5ZDQwZTMwZmQzMCJ9.v2PFCQoqpkzbsBDd6y5t7cJn49poPwn53GnHZLPKntE
            X-Refresh-Token: eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDUxMzY5ODMsInVzZXJfaWQiOjM3MzUsInVpZCI6IjM0MDdhYzk1LTJkNzAtNGU5MC04MGY5LWJiNTE4ZDRiZmE2MyJ9.JcZ5wNXELrgq8ouEx_ZzyXHg-wYkaP_Lt8Tlymhm8cI
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "2128",
                  "type": "task",
                  "attributes": {
                    "name": "Stressed Out",
                    "position": 0,
                    "due_date": "2020-11-06T00:00:00.000Z",
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
                  "id": "2129",
                  "type": "task",
                  "attributes": {
                    "name": "Tonight Tonight",
                    "position": 1,
                    "due_date": "2020-11-06T00:00:00.000Z",
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
                  "id": "2130",
                  "type": "task",
                  "attributes": {
                    "name": "Hello",
                    "position": 2,
                    "due_date": "2020-11-06T00:00:00.000Z",
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
    + id: `2131` (number, required)

+ Request returns task
**GET**&nbsp;&nbsp;`/api/v1/tasks/2131`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDQ1MzU3ODMsInVzZXJfaWQiOjM3MzYsInVpZCI6ImI3YWRjYTM1LTQ3NzYtNGVjMS1hNjcyLTEyMjlmMGRhNzc2NCJ9.z6ZW5PG-t-bJrzYk7r4d0TTiRx8e7zzDCSiZmvkUiuA
            X-Refresh-Token: eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDUxMzY5ODMsInVzZXJfaWQiOjM3MzYsInVpZCI6IjZlYjYwYTAwLWNhYzktNGQ3ZS05NGMyLWY0ZWRmYWU2Mjg5ZSJ9.Jr2nrCvBKlVAhIjwIRIvVmtqAaTWlQfc_JprHaX0Djc
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2131",
                "type": "task",
                "attributes": {
                  "name": "Ex's & Oh's",
                  "position": 0,
                  "due_date": "2020-11-06T00:00:00.000Z",
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
    + id: `2132` (number, required)

+ Request returns task
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/2132`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDQ1MzU3ODMsInVzZXJfaWQiOjM3MzcsInVpZCI6IjNhZGQxOGMzLWY2MWUtNGIzYi1iN2IwLWIwYmFjMWU1YjYyMiJ9.xLziqueVLnaHxn16rjvcGpI3dpkGF3uwqlFX1G7q9Eo
            X-Refresh-Token: eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDUxMzY5ODMsInVzZXJfaWQiOjM3MzcsInVpZCI6IjdlYjZkYWU2LTE1YjctNDgxOS1iYzRhLWRhMzJlYTk3MjNkNCJ9.2DyZL7mXqan-66L3OzacGchKaX9rWwMkibHXnXnht0w
            Content-Type: application/json

    + Body

            {
              "data": {
                "name": "No Role Modelz",
                "due_date": "2020-11-06"
              }
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2132",
                "type": "task",
                "attributes": {
                  "name": "No Role Modelz",
                  "position": 0,
                  "due_date": "2020-11-06T00:00:00.000Z",
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
    + project_id: `3109` (number, required)

+ Request returns task
**POST**&nbsp;&nbsp;`/api/v1/projects/3109/tasks`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDQ1MzU3ODMsInVzZXJfaWQiOjM3MzksInVpZCI6ImMxMzRjNWNiLTFlODMtNGJmMy1iMmU1LTlmM2YwNTgwZWViNyJ9.nuzQLhZnD1vPTyDFByx6p9kKrjNr1n308JgJonrWk3g
            X-Refresh-Token: eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDUxMzY5ODMsInVzZXJfaWQiOjM3MzksInVpZCI6IjQ4MWM2NWNiLTYwZjEtNDk2ZS05ZWIzLTUwYjYyNWM4MzU5YiJ9.lcDoLk3N8C5jTsGkWP1TEcOeuewQWqm2yoLObMtmH5E
            Content-Type: application/json

    + Body

            {
              "data": {
                "name": "History"
              }
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2133",
                "type": "task",
                "attributes": {
                  "name": "History",
                  "position": 0,
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
    + id: `2134` (number, required)

+ Request returns http no content status
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/2134`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDQ1MzU3ODMsInVzZXJfaWQiOjM3NDEsInVpZCI6IjYxOGJlNWE2LTM1OWEtNGViYy05ZWEwLTc0MGQ3MzA3MzgxNiJ9.wR1g_cbrKWOt4gMHwbxIO2hz5PoQSIkXLHT7uqNMaio
            X-Refresh-Token: eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDUxMzY5ODMsInVzZXJfaWQiOjM3NDEsInVpZCI6IjdjNzM3M2IzLTczN2QtNDk3NC1iYjQ5LTk5NDAwZDA2OThjMCJ9.0x19DT4PYysZP74QZi7vHXsbyCvqCSCPtQp4QBTc9vs
            Content-Type: application/json

+ Response 204

### Compelete a task [PATCH /api/v1/tasks/{task_id}/complete]

+ Parameters
    + task_id: `2135` (number, required)

+ Request returns task
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/2135/complete`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDQ1MzU3ODMsInVzZXJfaWQiOjM3NDIsInVpZCI6IjdiNDgzZGUxLTlmNjAtNDMxMC1hMjA2LThlODYyMzUyODAxMSJ9.ggMmGvfJUQE55JWFnxyfnFQ5xKwkLhGbfkfYZJvKfaE
            X-Refresh-Token: eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDUxMzY5ODMsInVzZXJfaWQiOjM3NDIsInVpZCI6ImYyMzNkZTU2LWFkODEtNGQ2OS1hNzk0LTAxNjNkM2FiNTgwMCJ9.0HAusYsNFYIragk0KfVOhQgqJc9qSDrl9OHfXGqCLLs
            Content-Type: application/json

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2135",
                "type": "task",
                "attributes": {
                  "name": "Coming Home",
                  "position": 0,
                  "due_date": "2020-11-06T00:00:00.000Z",
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
    + task_id: `2136` (number, required)

+ Request returns position
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/2136/position`

    + Headers

            Accept: application/json
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDQ1MzU3ODMsInVzZXJfaWQiOjM3NDMsInVpZCI6IjE4NmI5ODE4LWFiNDAtNDAwMi04ZjZmLTU4ZGU4OTYzNGQ4OCJ9.KCeafuFsCyMl_FItTFrW5JIoROkcnFmBaZ_k6UbOB1k
            X-Refresh-Token: eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDUxMzY5ODMsInVzZXJfaWQiOjM3NDMsInVpZCI6IjA3OTY4N2FiLTIxZmYtNDUxZi1hOGQ3LTllOTk1NTU5MjRjOSJ9.335pRBL-W4b1oWaciRNQkwvrOb6hXC0J0vVphPIkxKg
            Content-Type: application/json

    + Body

            {
              "data": {
                "position": 1
              }
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2136",
                "type": "position",
                "attributes": {
                  "position": 1
                }
              }
            }
