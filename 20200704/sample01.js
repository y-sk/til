function main() {
  func('func1');
  func('func2');
  func('func3');
}

function func(funcName) {
  console.log('Run %s', funcName);
}

main();