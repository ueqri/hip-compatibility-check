# HIP Compatibility Check
Using regex search to check whether certain CUDA application is able to be ported to HIP using [HIPIFY](https://github.com/ROCm-Developer-Tools/HIPIFY).

The latest _CUDA Runtime API functions supported by HIP_ is here,
https://github.com/ROCm-Developer-Tools/HIP/blob/master/docs/markdown/CUDA_Runtime_API_functions_supported_by_HIP.md

and I just reorganized the format for the convenience of Shell Programming. The table can be found in `cuda2hip.md`.

## Usage
1. Change the `SOURCE_DIR` variable in `regex.sh` to your own CUDA project directory.
2. Make sure the format style of `cuda2hip.md` or `CUDA2HIP_FILE` is a pure table in markdown, and the content is the latest.
3. Run `./regex.sh`, and if there is any function call, data types, definition, etc. not supported by HIP, the codes together with source name will be printed.

## Note
The data types used by CUDA Runtime `MAJOR_VERSION` & `MINOR_VERSION` must be excluded from the `CUDA2HIP_FILE` or the results will be confusing.