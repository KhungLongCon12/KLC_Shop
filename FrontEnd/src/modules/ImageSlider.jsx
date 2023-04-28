import React from 'react'
import Carousel from 'react-material-ui-carousel'
import imgSlider from "../helper/slider-img.json"
import { Button, Paper } from '@mui/material'


export function ImageSlider() {
    return (
        <Carousel >
            {
                imgSlider.map(item => <Item key={item.id} item={item} />)
            }
        </Carousel>
    )
}

function Item({ item }) {
    return (
        <Paper>
            <img src={item.image} alt={item.description} style={{ width: '100%', height: '45vh' }} />
            <h2>{item.description}</h2>
            <Button>
                Check it
            </Button>
        </Paper>

    )
}



