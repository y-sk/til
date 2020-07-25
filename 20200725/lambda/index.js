exports.handler = (event, context, callback) => {
  console.log("ENV:",     JSON.stringify(process.env, null, 2))
  console.log("EVENT:",   JSON.stringify(event,       null, 2))
  console.log("CONTEXT:", JSON.stringify(context,     null, 2))
  return context.logStreamName
}
