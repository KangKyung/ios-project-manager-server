# Project Manager Server API

## Thing 목록 받기

### Start line

| Method | URL  |Description|
| - | -|---|
| GET    | /things |모든 Thing을 불러온다.|

### Response

| Name | Type | Description | Required|
| -------- | -------- | -------- |---|
| id | Number | Thing의 고유한 id 값 |Required|
| title | String | Thing의 제목 |Optional|
| description | String | Thing의 세부내용 |Optional|
| state | String | Thing의 상태 |Required|
| due_date | Number | Thing의 기한 |Required|
| updated_at | Number | Thing이 생성된 시간 |Required|


#### Sample 

```json
[
    {
      "id": 1,
      "title": "서버 환경설정",
      "description": "Homebrew를 통해 Vapor Toolbox 설치하기",
      "state": "todo",
      "due_date": 1611523563.719116,
      "modification_date": 1611523563.719116,
    }
    ,
    {
      "id": 2,
      "title": "서버 API 문서 작성하기",
      "description": null,
      "state": "doing",
      "due_date": 16115462413.28349,
      "modification_date": 16115462413.28349,
    }
    ,
    {
      "id": 3,
      "title": "API 설계하기",
      "description": null,
      "state": "doing",
      "due_date": 1611598271.28371,
      "modification_date": 1611598271.28371,
    }
]
```

## Thing 생성하기
### Start line

| Method | URL  |Description|
| - | -|---|
| POST | /things |새로운 Thing을 생성한다.|
### Request
| Content-Type                    |
| ------------------------------- |
| application/json; charset=utf-8 |

| Name | Type | Description | Required|
| -------- | -------- | -------- | -------- |
| title | String | 새로운 Thing의 제목 | Optional |
| description | String | 새로운 Thing의 세부내용 | Optional |
| state | String | 새로운 Thing의 상태 (기본은 Todo) | Required |
| due_date | Number | 새로운 Thing의 기한 | Required |
### Response

#### Success
|Status Code | Content-Type                    |
|-| ------------------------------- |
|200| application/json; charset=utf-8 |

| Name | Type | Description | Required|
| -------- | -------- | -------- | -------- |
|id|Number|새로 생성된 Thing의 id 값|Required|
| title | String | 새로운 Thing의 제목 | Optional |
| description | String | 새로운 Thing의 세부내용 | Optional |
| state | String | 새로운 Thing의 상태 (기본은 Todo) | Required |
| due_date | Number | 새로운 Thing의 기한 | Required |
#### Failure
|Status Code | Content-Type                    |
|-| ------------------------------- |
|400| application/json; charset=utf-8 |

| Name | Type | Description | Required|
| -------- | -------- | -------- | -------- |
|error_message|String|에러 메세지|Required|


```json
400 Error
{
	"error_message": "The essential thing is missing."  
}
```

## Thing 수정하기

### Start line

| Method | URL  |Description|
| - | -|---|
| PATCH | /things/:id |기존의 Thing을 수정한다.|
### Request
| Content-Type                    |
| ------------------------------- |
| application/json; charset=utf-8 |

| Name | Type | Description | Required|
| -------- | -------- | -------- | -------- |
| title | String | 수정할 Thing의 제목 | Optional |
| description | String | 수정할 Thing의 세부내용 | Optional |
| state | String | 수정할 Thing의 상태 | Optional |
| due_date | Number | 수정할 Thing의 기한 | Optional |
### Response

#### Success 
|Status Code | Content-Type                    |
|-| ------------------------------- |
|200| application/json; charset=utf-8 |

| Name | Type | Description | Required|
| -------- | -------- | -------- | -------- |
|id|Number|수정된 Thing의 id 값|Required|
| title | String | 수정할 Thing의 제목 | Optional |
| description | String | 수정할 Thing의 세부내용 | Optional |
| state | String | 수정할 Thing의 상태 | Optional |
| due_date | Number | 수정할 Thing의 기한 | Optional |
|updated_at|Number|수정된 시간|Required|

#### Failure
|Status Code | Content-Type                    |
|-| ------------------------------- |
|400| application/json; charset=utf-8 |

| Name | Type | Description | Required|
| -------- | -------- | -------- | -------- |
|error_message|String|에러 메세지|Required|

|Status Code | Content-Type                    |
|-| ------------------------------- |
|404| application/json; charset=utf-8 |

| Name | Type | Description | Required|
| -------- | -------- | -------- | -------- |
|error_message|String|에러 메세지|Required|


```json
400 Error
{
	"error_message": "The request is invalid."  
}
```
```json
404 Error
{
	"error_message": "Thing is Not Found."  
}
```

## Thing 삭제하기

### Start line

| Method | URL  |Description|
| - | -|---|
| DELETE | /things/:id |Thing을 삭제한다.|

### Response

#### Success 
|Status Code | Content-Type                    |
|-| ------------------------------- |
|200| application/json; charset=utf-8 |

| Name | Type | Description | Required|
| -------- | -------- | -------- | -------- |
| id | Number | Thing의 고유한 id 값 |Required|
| title | String | Thing의 제목 |Optional|
| description | String | Thing의 세부내용 |Optional|
| state | String | Thing의 상태 |Required|
| due_date | Number | Thing의 기한 |Required|
| updated_at | Number | Thing이 삭제된 시간 |Required|

#### Failure
|Status Code | Content-Type                    |
|-| ------------------------------- |
|400| application/json; charset=utf-8 |

| Name | Type | Description | Required|
| -------- | -------- | -------- | -------- |
|error_message|String|에러 메세지|Required|

```json
400 Error
{
	"error_message": "The request is invalid."  
}
```
```json
404 Error
{
	"error_message": "Thing is Not Found."  
}
```

