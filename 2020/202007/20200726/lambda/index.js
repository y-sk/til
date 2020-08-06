const AWS = require('aws-sdk')

const options = { endpoint: 'http://192.168.33.10:8000' }
const dynamo  = new AWS.DynamoDB.DocumentClient(options)

exports.handler = (event, context, callback) => {
  console.log("ENV:",     JSON.stringify(process.env, null, 2))
  console.log("EVENT:",   JSON.stringify(event,       null, 2))
  console.log("CONTEXT:", JSON.stringify(context,     null, 2))
  let tableList = [1, 2, 3, 4, 5]
  tableList.map( id => {
    let tableName = 'test'
    getItems(tableName, id)
    .then((result) => {
      console.info("result", id, result)
    })
    .catch((error) => {
      console.error("Error", id, error)
    })
  })
  return context.logStreamName
}

const getItems = (tableName, id) => {
  const params = {
    TableName: tableName
    , KeyConditionExpression: "#c1 = :v1"
    , ExpressionAttributeNames:{
      "#c1": "Id"
    }
    , ExpressionAttributeValues: {
      ":v1": id
    }
  }
  return dynamo.query(params).promise()
}

