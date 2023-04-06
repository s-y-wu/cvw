let wasm;

WebAssembly.instantiateStreaming(fetch('~/cvw/examples/fp/fpcalc/fpcalc.wasm'))
.then(obj => {
    wasm = obj.instance.exports;
    console.log('WASM module loaded:', wasm);
})
.catch(error => {
    console.error('Failed to load WASM module:', error);
});

