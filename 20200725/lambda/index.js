exports.handler = (event, context, callback) => {
  console.log("ENV:",     JSON.stringify(process.env))
  console.log("EVENT:",   JSON.stringify(event)      )
  console.log("CONTEXT:", JSON.stringify(context)    )
  return context.logStreamName
}
