const sample = [];

function main() {
  genTestData();
  console.log("MAIN START");
  console.log("%O", sample);
  sample.map( v => {
    sort(v).then( v => {
      console.log("sorted %O", v);
    });
  });
  console.log("%O", sample);
  console.log("MAIN END");
}

function genTestData() {
  for (let n = 0; n < 30; n++) {
    let idx = Math.floor( Math.random() * 1000  ) % 5;
    let val = Math.floor( Math.random() * 10000 ) % 100;
    if( ! sample[idx] ) {
      sample[idx] = {
          id : idx
        , val: []
      };
    }
    sample[idx].val.push(val);
  }
}

async function sort(list) {
  await sleep( Math.random() * 1000 );
  list.val.sort( (a, b) => {
    return a - b;
  });
  return list;
}

function sleep(timeout) {
  return new Promise( resolve => {
    setTimeout(() => {
      resolve(timeout);
    }, timeout);
  });
}

main();
