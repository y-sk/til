function main() {
  func('func1', Math.random() * 1000);
  func('func2', Math.random() * 1000);
  func('func3', Math.random() * 1000);
}

async function func(funcName, timeout) {
  console.log('Start %s %s', funcName, timeout);
  await sleep(timeout);
  console.log('End   %s %s', funcName, timeout);
  return funcName;
}

async function sleep(timeout) {
  return new Promise( resolve => {
    setTimeout(() => {
      resolve();
    }, timeout);
  });
}

main();
