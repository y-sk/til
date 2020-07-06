async function main() {
  const list = [1, 2, 3];
  for ( n of list ) {
    let funcName = ('func%s', n);
    await func(funcName, Math.random() * 1000);
  }
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
