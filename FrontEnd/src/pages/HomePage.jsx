import React from 'react';
import Navbar from '../modules/Navbar';
import { Products } from '../modules/Products';

export default function HomePage() {
    return (
        <React.Fragment>
            <Navbar />
            {/* <ImageSlider /> */}
            <Products />
        </React.Fragment>
    )
}