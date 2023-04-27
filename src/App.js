import React from "react";
import { BrowserRouter, Outlet, Route, Routes } from "react-router-dom";
import { Cart } from "./pages/Cart";
import HomePage from "./pages/HomePage";
import { Login } from "./pages/Login";
import { SignUp } from "./pages/SignUp";
import { ResetPassword } from "./pages/ResetPassword";

export default function App() {
    return (
        <React.Fragment>
            <BrowserRouter>
                <Routes>
                    <Route path="/" element={<HomePage />} />
                    <Route path="/login" element={<Login />} />
                    <Route path="/signup" element={<SignUp />} />
                    <Route path="/cart" element={<Cart />} />
                </Routes>
                <Outlet />
            </BrowserRouter>
        </React.Fragment>
    )
}