import React from 'react';
import { Paper } from '@mui/material';
import LeftSideBar from '../modules/LeftSideBar';
import Navbar from '../modules/Navbar';


export default function HomePage() {
    return (
        <React.Fragment>
            <Paper >
                <Navbar />
                <LeftSideBar />
            </Paper>
        </React.Fragment>
    )
}