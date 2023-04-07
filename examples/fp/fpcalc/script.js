let wasm;

const importObject = {
    env: {
      memoryBase: 0,
      tableBase: 0,
      memory: new WebAssembly.Memory({ initial: 256 }),
      table: new WebAssembly.Table({ initial: 0, element: 'anyfunc' }),
    }
  };

WebAssembly.instantiateStreaming(fetch('http://127.0.0.1:5500/examples/fp/fpcalc/fpcalc.wasm'), importObject)
.then(obj => {
    wasm = obj.instance.exports;
    console.log('WASM module loaded:', wasm);
})
.catch(error => {
    console.error('Failed to load WASM module:', error);
});

function add(a, b) {
    return a + b;
}

let result = add(2, 4);
console.log('Result:', result);
