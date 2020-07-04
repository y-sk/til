async function main() {
  await func('func1', Math.random() * 1000);
  await func('func2', Math.random() * 1000);
  await func('func3', Math.random() * 1000);
}

async function func(funcName, timeout) {
  console.log('Start %s %s', funcName, timeout);
  await sleep(timeout);
  console.log('End   %s %s', funcName, timeout);
  return funcName;
}

function sleep(timeout) {
  return new Promise( resolve => {
    setTimeout(() => {
      resolve();
    }, timeout);
  });
}

main();
