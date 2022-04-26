"use strict";
/*
 * ATTENTION: An "eval-source-map" devtool has been used.
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file with attached SourceMaps in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
(() => {
var exports = {};
exports.id = "pages/api/discount";
exports.ids = ["pages/api/discount"];
exports.modules = {

/***/ "@prisma/client":
/*!*********************************!*\
  !*** external "@prisma/client" ***!
  \*********************************/
/***/ ((module) => {

module.exports = require("@prisma/client");

/***/ }),

/***/ "(api)/./pages/api/discount/index.js":
/*!*************************************!*\
  !*** ./pages/api/discount/index.js ***!
  \*************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (__WEBPACK_DEFAULT_EXPORT__)\n/* harmony export */ });\nconst { PrismaClient  } = __webpack_require__(/*! @prisma/client */ \"@prisma/client\");\nconst prisma = new PrismaClient();\n/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (async (req, res)=>{\n    switch(req.method){\n        case \"POST\":\n            // gets data from request body\n            const { name , is_percentage , is_flat_rate , percentage , flat_rate  } = req.body;\n            const data = {};\n            data.name = name;\n            data.is_percentage = is_percentage === \"true\";\n            data.is_flat_rate = is_flat_rate === \"true\";\n            data.percentage = percentage ? percentage : 0;\n            data.flat_rate = flat_rate ? flat_rate : 0;\n            console.log(data);\n            // creates discount with data from request body\n            const discount = await prisma.discount.create({\n                data\n            });\n            console.log(discount);\n            res.status(200).json(data);\n            break;\n    }\n});\n//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiKGFwaSkvLi9wYWdlcy9hcGkvZGlzY291bnQvaW5kZXguanMuanMiLCJtYXBwaW5ncyI6Ijs7OztBQUFBLE1BQU0sRUFBRUEsWUFBWSxHQUFFLEdBQUdDLG1CQUFPLENBQUMsc0NBQWdCLENBQUM7QUFDbEQsTUFBTUMsTUFBTSxHQUFHLElBQUlGLFlBQVksRUFBRTtBQUNqQyxpRUFBZSxPQUFPRyxHQUFHLEVBQUVDLEdBQUcsR0FBSztJQUMvQixPQUFRRCxHQUFHLENBQUNFLE1BQU07UUFDZCxLQUFLLE1BQU07WUFDUCw4QkFBOEI7WUFDOUIsTUFBTSxFQUFDQyxJQUFJLEdBQUVDLGFBQWEsR0FBRUMsWUFBWSxHQUFFQyxVQUFVLEdBQUVDLFNBQVMsR0FBRSxHQUFHUCxHQUFHLENBQUNRLElBQUk7WUFDNUUsTUFBTUMsSUFBSSxHQUFHLEVBQUc7WUFDaEJBLElBQUksQ0FBQ04sSUFBSSxHQUFHQSxJQUFJO1lBQ2hCTSxJQUFJLENBQUNMLGFBQWEsR0FBSUEsYUFBYSxLQUFLLE1BQU07WUFDOUNLLElBQUksQ0FBQ0osWUFBWSxHQUFJQSxZQUFZLEtBQUssTUFBTTtZQUM1Q0ksSUFBSSxDQUFDSCxVQUFVLEdBQUlBLFVBQVUsR0FBR0EsVUFBVSxHQUFHLENBQUM7WUFDOUNHLElBQUksQ0FBQ0YsU0FBUyxHQUFJQSxTQUFTLEdBQUdBLFNBQVMsR0FBRyxDQUFDO1lBQzNDRyxPQUFPLENBQUNDLEdBQUcsQ0FBQ0YsSUFBSSxDQUFDO1lBQ2pCLCtDQUErQztZQUMvQyxNQUFNRyxRQUFRLEdBQUcsTUFBTWIsTUFBTSxDQUFDYSxRQUFRLENBQUNDLE1BQU0sQ0FBQztnQkFBQ0osSUFBSTthQUFDLENBQUM7WUFDckRDLE9BQU8sQ0FBQ0MsR0FBRyxDQUFDQyxRQUFRLENBQUM7WUFDckJYLEdBQUcsQ0FBQ2EsTUFBTSxDQUFDLEdBQUcsQ0FBQyxDQUFDQyxJQUFJLENBQUNOLElBQUksQ0FBQztZQUMxQixNQUFLO0tBQ1o7Q0FDRiIsInNvdXJjZXMiOlsid2VicGFjazovL3NpdGUvLi9wYWdlcy9hcGkvZGlzY291bnQvaW5kZXguanM/NDQyYSJdLCJzb3VyY2VzQ29udGVudCI6WyJjb25zdCB7IFByaXNtYUNsaWVudCB9ID0gcmVxdWlyZSgnQHByaXNtYS9jbGllbnQnKVxuY29uc3QgcHJpc21hID0gbmV3IFByaXNtYUNsaWVudCgpXG5leHBvcnQgZGVmYXVsdCBhc3luYyAocmVxLCByZXMpID0+IHtcbiAgICBzd2l0Y2ggKHJlcS5tZXRob2QpIHtcbiAgICAgICAgY2FzZSAnUE9TVCc6XG4gICAgICAgICAgICAvLyBnZXRzIGRhdGEgZnJvbSByZXF1ZXN0IGJvZHlcbiAgICAgICAgICAgIGNvbnN0IHtuYW1lLCBpc19wZXJjZW50YWdlLCBpc19mbGF0X3JhdGUsIHBlcmNlbnRhZ2UsIGZsYXRfcmF0ZSB9ID0gcmVxLmJvZHlcbiAgICAgICAgICAgIGNvbnN0IGRhdGEgPSB7IH1cbiAgICAgICAgICAgIGRhdGEubmFtZSA9IG5hbWVcbiAgICAgICAgICAgIGRhdGEuaXNfcGVyY2VudGFnZSA9IChpc19wZXJjZW50YWdlID09PSAndHJ1ZScpXG4gICAgICAgICAgICBkYXRhLmlzX2ZsYXRfcmF0ZSA9IChpc19mbGF0X3JhdGUgPT09ICd0cnVlJylcbiAgICAgICAgICAgIGRhdGEucGVyY2VudGFnZSA9IChwZXJjZW50YWdlID8gcGVyY2VudGFnZSA6IDApXG4gICAgICAgICAgICBkYXRhLmZsYXRfcmF0ZSA9IChmbGF0X3JhdGUgPyBmbGF0X3JhdGUgOiAwKVxuICAgICAgICAgICAgY29uc29sZS5sb2coZGF0YSlcbiAgICAgICAgICAgIC8vIGNyZWF0ZXMgZGlzY291bnQgd2l0aCBkYXRhIGZyb20gcmVxdWVzdCBib2R5XG4gICAgICAgICAgICBjb25zdCBkaXNjb3VudCA9IGF3YWl0IHByaXNtYS5kaXNjb3VudC5jcmVhdGUoe2RhdGF9KVxuICAgICAgICAgICAgY29uc29sZS5sb2coZGlzY291bnQpXG4gICAgICAgICAgICByZXMuc3RhdHVzKDIwMCkuanNvbihkYXRhKVxuICAgICAgICAgICAgYnJlYWtcbiAgICB9XG4gIH1cbiJdLCJuYW1lcyI6WyJQcmlzbWFDbGllbnQiLCJyZXF1aXJlIiwicHJpc21hIiwicmVxIiwicmVzIiwibWV0aG9kIiwibmFtZSIsImlzX3BlcmNlbnRhZ2UiLCJpc19mbGF0X3JhdGUiLCJwZXJjZW50YWdlIiwiZmxhdF9yYXRlIiwiYm9keSIsImRhdGEiLCJjb25zb2xlIiwibG9nIiwiZGlzY291bnQiLCJjcmVhdGUiLCJzdGF0dXMiLCJqc29uIl0sInNvdXJjZVJvb3QiOiIifQ==\n//# sourceURL=webpack-internal:///(api)/./pages/api/discount/index.js\n");

/***/ })

};
;

// load runtime
var __webpack_require__ = require("../../webpack-api-runtime.js");
__webpack_require__.C(exports);
var __webpack_exec__ = (moduleId) => (__webpack_require__(__webpack_require__.s = moduleId))
var __webpack_exports__ = (__webpack_exec__("(api)/./pages/api/discount/index.js"));
module.exports = __webpack_exports__;

})();