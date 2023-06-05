import React, { useState } from 'react';
import Navbar from '../modules/Navbar';
import { Products } from '../modules/Products';
import { Login } from './Login';

export default function HomePage() {
    const [loggedInUser, setLoggedInUser] = useState(null);
    let isActive = false;

    const handleLogin = (user) => {
        setLoggedInUser(user)
        isActive = true
    }

    const handleLogout = (user) => {
        setLoggedInUser(null)
    }
    return (
        <React.Fragment>
            <Navbar loggedInUser={loggedInUser} onLogout={handleLogout} />
            {/* <Login onLogin={handleLogin} />
            <Products /> */}
            {loggedInUser ? (
                <Products />
            ) : (
                <Login onLogin={handleLogin} />

            )}
        </React.Fragment>
    )
}