<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

// Route::post("/login", "AuthController@login");
Route::post("/login", "AuthKaryawanController@login");
// Route::get("/login", "Login@show");

Route::get("/presensi", "PresensiController@presensi")->middleware("auth:api");
Route::get("/masuk",    "PresensiController@masuk")->middleware("auth:api");
Route::post("/masuk",   "PresensiController@storeMasuk")->middleware("auth:api");
Route::get("/pulang",   "PresensiController@pulang")->middleware("auth:api");
Route::post("/pulang",  "PresensiController@storePulang")->middleware("auth:api");
Route::get("/report",   "ReportController@index")->middleware("auth:api");

// UPDATED
// informasi by -> id
Route::get("/informasi-umum",           "InformasiUmumController@index")->middleware("auth:api");
Route::post("/informasi-umum",          "InformasiUmumController@store")->middleware("auth:api");
Route::get("/informasi-umum/{id}",      "InformasiUmumController@show")->middleware("auth:api");
Route::put("/informasi-umum/{id}",      "InformasiUmumController@update")->middleware("auth:api");
Route::delete("/informasi-umum/{id}",   "InformasiUmumController@destroy")->middleware("auth:api");

// informasi by -> school id
Route::get("/informasi-umum/school/{id}",   "InformasiUmumSchoolController@show")->middleware("auth:api");


Route::post("/loginAdmin",  "AuthController@loginAdmin");
Route::post("/task",        "TaskController@store");

Route::post("/forgot-password",  "ForgotPasswordController@forgot_password");
Route::post("/change-password",  "ForgotPasswordController@change_password");