import React from 'react';
import Navbar from '../modules/Navbar';
import { ImageSlider } from '../modules/ImageSlider';



export default function HomePage() {
    return (
        <React.Fragment>
            <Navbar />
            <ImageSlider />
        </React.Fragment>
    )
}